import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:spotify/core/routes/app_router.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/features/auth/signin/presentation/bloc/auth_bloc.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/favroite_song_bloc/favroite_song_bloc.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/song_bloc/song_bloc.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/tab_bloc/tabs_bloc.dart';
import 'package:spotify/features/dashboard/presentation/bloc/bottom_nav_tab_bloc.dart';
import 'package:spotify/features/music/presentation/bloc/song_player/song_player_bloc.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/init_dependencies.dart';
import 'package:spotify/notification_service.dart';
import 'features/music/presentation/bloc/position/position_bloc.dart';

// MyAudioHandler audioHandler = MyAudioHandler();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Future.wait([
    initDependencies(),
    JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
    NotificationService.instance.initialize(),
  ]);

  //--- Push Notification Setup ---//
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // await messaging.requestPermission(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  //   provisional: false,
  // );

  // await FirebaseMessaging.instance.requestPermission();

  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );

  // FirebaseCloudMessaging firebaseCloudMessaging = FirebaseCloudMessaging();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // await firebaseCloudMessaging.setupFlutterNotifications();
  // await firebaseCloudMessaging.getFirebaseNotification();

  // DynamicLinkService().initDynamicLink();

  //---------------- End ------------------------ //

  //-----DeepLink---------------------------------------------------------------- //
  // DynamicLinkService dynamicLinkService = DynamicLinkService();
  // dynamicLinkService.createLink("dsf4rf4ger").then((value) {
  //   Share.share(value);
  // });

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kColorTransparent,
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocator<SongBloc>()),
        BlocProvider(create: (_) => serviceLocator<FavroiteSongBloc>()),
        BlocProvider(create: (_) => serviceLocator<SongPlayerBloc>()),
        BlocProvider<PositionBloc>(
            create: (BuildContext context) => PositionBloc()),
        BlocProvider<BottomNavTabBloc>(
            create: (BuildContext context) => BottomNavTabBloc()),
        BlocProvider<TabsBloc>(create: (BuildContext context) => TabsBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = serviceLocator<AppRouter>();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        key: navigatorKey,
        routerConfig: appRouter.config(),
        title: 'Spotify',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
