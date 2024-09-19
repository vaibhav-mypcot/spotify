import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spotify/core/functions/handle_message.dart';
import 'package:spotify/core/routes/app_router.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/init_dependencies.dart';
import 'package:spotify/main.dart';

class FirebaseCloudMessaging {
  final ctx = MyApp.navigatorKey.currentContext;

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      // ignore: use_build_context_synchronously
      handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleMessage(message);
    });
  }

  //Handle Terminated messages here
  // void _handleMessage(RemoteMessage message) async {
  //   print(message.data);
  //   print("here is getting the data: ${message.data}");

  //   Map<String, dynamic> fgData = message.data;
  //   final fgRoute = fgData['screen'];
  //   final fgID = fgData['id'];
  //   final fgTitle = fgData['title'];

  //   if (fgRoute == "CuponsDetailRoute") {
  //     print('\x1B[33mThis is successfull.\x1B[0m');
  //     serviceLocator<AppRouter>().push(CuponDetailRoute(id: fgID, name: fgTitle));
  //   }
  // }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? fcmToken;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  //Foreground type variables
  dynamic fgType;
  dynamic fgId;
  dynamic fgCollType;
  dynamic fgCollTitle;

  getFirebaseNotification() async {
    FirebaseMessaging.instance.getAPNSToken().then((APNStoken) {
      print('here is APN token ---$APNStoken');
    });
    firebaseMessaging.getToken().then((value) async {
      fcmToken = value.toString();
      print('here is fcm token ---$fcmToken');
    }).catchError((onError) {
      print("Exception: $onError");
    });

    //We can use multiple subscription topics for different different Notifications
    firebaseMessaging.subscribeToTopic("soptify");

    //For Foreground Notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Show flutter notificcation");
      showFlutterNotification(message);

      print("remote message data ${message.data}");

      print(message.data);
      print('----------- here');
    });
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    print("?????????????????????????????????????");
    print("Title: ${message.data['title']}");
    print("Data: ${message.data['body']}");

    String payload = jsonEncode(message.data);

    flutterLocalNotificationsPlugin?.show(
      1,
      message.data['title'].toString(),
      message.data['body'].toString(),
      payload: payload,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: android?.smallIcon ?? 'mipmap/ic_launcher',
          channelDescription: channel.description,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
    );

    // if (notification != null && android != null) {

    // }
  }

  Future<void> setupFlutterNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    if (Platform.isIOS) {
      NotificationSettings settings = await FirebaseMessaging.instance
          .requestPermission(
              alert: true,
              announcement: false,
              badge: true,
              carPlay: false,
              criticalAlert: false,
              sound: true,
              provisional: false);
      print("user granted permission : ${settings.authorizationStatus}");
    }
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (
              int id,
              String? title,
              String? body,
              String? payload,
            ) async {
              print('here is payload ---> $payload');
            });

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      // macOS: initializationSettingsMacOS,
    );

    //-- Foreground

    void onReceiveNotificationResponse(NotificationResponse payload) async {
      /////////////////////////VIBHOR//////////////////////
      //Foreground redirection code
      // Parse the payload to get the data
      final data = payload.payload != null ? jsonDecode(payload.payload!) : {};

      // Extract the 'screen' field from the data
      final screen = data['screen'];
      final fgID = data['id'];
      final fgTitle = data['title'];

      final fgIndex = data['index'];
      final fgTopAlbums = data['top-alubums'];

      List<Map<String, dynamic>> albumList = [];

      fgTopAlbums.forEach((album) {
        albumList.add({
          'artist': album['artist'],
          'duration': album['duration'],
          'id': album['id'],
          'isFavorite': album['isFavorite'],
          'title': album['title'],
        });
      });

      if (data == "CuponsDetailRoute") {
        print('\x1B[33mThis is successfull.\x1B[0m');
        serviceLocator<AppRouter>()
            .push(MusicRoute(index: fgIndex, songsList: albumList));
      }
    }

    await flutterLocalNotificationsPlugin?.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onReceiveNotificationResponse);

    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      playSound: true,
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
