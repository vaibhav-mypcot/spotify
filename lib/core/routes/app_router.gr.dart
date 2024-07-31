// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:spotify/features/access/presentation/pages/access_page.dart'
    as _i1;
import 'package:spotify/features/auth/signin/presentation/pages/signin_page.dart'
    as _i10;
import 'package:spotify/features/auth/signin/presentation/pages/signup_page.dart'
    as _i11;
import 'package:spotify/features/dashboard/bottom_nav_pages/discover/presentation/discover_page.dart'
    as _i3;
import 'package:spotify/features/dashboard/bottom_nav_pages/favourite/presentation/favourite_page.dart'
    as _i4;
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/page/home_page.dart'
    as _i5;
import 'package:spotify/features/dashboard/bottom_nav_pages/profile/presentation/profile_page.dart'
    as _i9;
import 'package:spotify/features/dashboard/presentation/pages/dashboard_page.dart'
    as _i2;
import 'package:spotify/features/intermidiate/presentation/intermidiate_page.dart'
    as _i6;
import 'package:spotify/features/music/presentation/page/music_page.dart'
    as _i7;
import 'package:spotify/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i8;
import 'package:spotify/features/splash/presentation/pages/splash_page.dart'
    as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AccessRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccessPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DiscoverPage(),
      );
    },
    FavouriteRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FavouritePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    IntermidiateRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.IntermidiatePage(),
      );
    },
    MusicRoute.name: (routeData) {
      final args = routeData.argsAs<MusicRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MusicPage(
          key: args.key,
          index: args.index,
          songsList: args.songsList,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnboardingPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfilePage(),
      );
    },
    SigninRoute.name: (routeData) {
      final args = routeData.argsAs<SigninRouteArgs>(
          orElse: () => const SigninRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SigninPage(key: args.key),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SignupPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccessPage]
class AccessRoute extends _i13.PageRouteInfo<void> {
  const AccessRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccessRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DiscoverPage]
class DiscoverRoute extends _i13.PageRouteInfo<void> {
  const DiscoverRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FavouritePage]
class FavouriteRoute extends _i13.PageRouteInfo<void> {
  const FavouriteRoute({List<_i13.PageRouteInfo>? children})
      : super(
          FavouriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.IntermidiatePage]
class IntermidiateRoute extends _i13.PageRouteInfo<void> {
  const IntermidiateRoute({List<_i13.PageRouteInfo>? children})
      : super(
          IntermidiateRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntermidiateRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MusicPage]
class MusicRoute extends _i13.PageRouteInfo<MusicRouteArgs> {
  MusicRoute({
    _i14.Key? key,
    required int index,
    required List<dynamic> songsList,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          MusicRoute.name,
          args: MusicRouteArgs(
            key: key,
            index: index,
            songsList: songsList,
          ),
          initialChildren: children,
        );

  static const String name = 'MusicRoute';

  static const _i13.PageInfo<MusicRouteArgs> page =
      _i13.PageInfo<MusicRouteArgs>(name);
}

class MusicRouteArgs {
  const MusicRouteArgs({
    this.key,
    required this.index,
    required this.songsList,
  });

  final _i14.Key? key;

  final int index;

  final List<dynamic> songsList;

  @override
  String toString() {
    return 'MusicRouteArgs{key: $key, index: $index, songsList: $songsList}';
  }
}

/// generated route for
/// [_i8.OnboardingPage]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SigninPage]
class SigninRoute extends _i13.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SigninRoute.name,
          args: SigninRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static const _i13.PageInfo<SigninRouteArgs> page =
      _i13.PageInfo<SigninRouteArgs>(name);
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SignupPage]
class SignupRoute extends _i13.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i13.PageInfo<SignupRouteArgs> page =
      _i13.PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
