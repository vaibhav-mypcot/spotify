import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spotify/core/routes/app_router.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/init_dependencies.dart';

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await NotificationService.instance.setupFlutterNotifications();
//   await NotificationService.instance.showNotification(message);
// }

class NotificationService {
  // Private constructor to restrict object creation
  NotificationService._();
  // Single, lazily-initialized instance
  static final NotificationService instance = NotificationService._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationIsInitialized = false;
  static String? fcmToken;

  Future<void> initialize() async {
    log("Initializing Firebase Messaging...");

    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await requestPermission();
    await _setupMessageHandler();

    // Token
    final token = await _firebaseMessaging.getToken();
    log("FCM Token: $token");
  }

  // 1. Request notification permission
  Future<void> requestPermission() async {
    final setting = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );
    log("Permission status : ${setting.authorizationStatus}");
  }

  // when setupFlutterNotifications() is executed the _isFlutterLocalNotificationIsInitialized set to be true,
  // cause we just need to setup this setting only once and if it is true we just return from this method

  // 2. Setup flutter notification
  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationIsInitialized) {
      return;
    }

    // Android Setup notification
    const channel = AndroidNotificationChannel(
      "high_importnace_channel",
      "High Importance Notification",
      description: "This channel is used for important notification.",
      importance: Importance.high,
    );

    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Ios setup notifications
    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      // macOS: initializationSettingsMacOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // ... Handle both Ios and Android Foreground
        log('id : ${notificationResponse.id}');
        log('title : ${notificationResponse.actionId}');
        log('body : ${notificationResponse.input}');
        log('payload : ${notificationResponse.payload}');
      },
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    _isFlutterLocalNotificationIsInitialized = true;
  }

  // 3. Show notification
  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      await _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "high_importnace_channel",
            "High Importance Notification",
            importance: Importance.high,
            priority: Priority.high,
            icon: "mipmap/ic_launcher",
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: false,
            presentBadge: false,
            presentSound: false,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  // 4. Handle Msg which come from firebase
  Future<void> _setupMessageHandler() async {
    // Foreground message
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });

    // opend app
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }

    // Background message
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    Map<String, dynamic> fgData = message.data;
    final fgRoute = fgData['screen'];
    if (fgRoute == 'DashboardRoute') {

      // open sign in screen
      serviceLocator<AppRouter>().push(SigninRoute());
    }
  }
}
