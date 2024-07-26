import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/routes/app_router.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/features/auth/signin/presentation/bloc/auth_bloc.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/song_bloc/song_bloc.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/tab_bloc/tabs_bloc.dart';
import 'package:spotify/features/dashboard/presentation/bloc/bottom_nav_tab_bloc.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        BlocProvider<BottomNavTabBloc>(
            create: (BuildContext context) => BottomNavTabBloc()),
        BlocProvider<TabsBloc>(create: (BuildContext context) => TabsBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(390, 849),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        title: 'Spotify',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
