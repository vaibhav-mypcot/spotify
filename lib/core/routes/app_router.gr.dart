// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:spotify/features/access/presentation/pages/access_page.dart'
    as _i1;
import 'package:spotify/features/auth/signin/presentation/pages/signin_page.dart'
    as _i15;
import 'package:spotify/features/auth/signin/presentation/pages/signup_page.dart'
    as _i16;
import 'package:spotify/features/cupons/presentation/pages/cupon_detail_page.dart'
    as _i2;
import 'package:spotify/features/cupons/presentation/pages/cupons_page.dart'
    as _i3;
import 'package:spotify/features/dashboard/bottom_nav_pages/discover/presentation/page/discover_page.dart'
    as _i5;
import 'package:spotify/features/dashboard/bottom_nav_pages/favourite/presentation/page/favourite_page.dart'
    as _i7;
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/page/home_page.dart'
    as _i8;
import 'package:spotify/features/dashboard/bottom_nav_pages/profile/presentation/page/profile_page.dart'
    as _i14;
import 'package:spotify/features/dashboard/presentation/pages/dashboard_page.dart'
    as _i4;
import 'package:spotify/features/favorites_songs/presentation/pages/favorites_songs.dart'
    as _i6;
import 'package:spotify/features/intermidiate/presentation/intermidiate_page.dart'
    as _i9;
import 'package:spotify/features/music/presentation/page/music_page.dart'
    as _i10;
import 'package:spotify/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i11;
import 'package:spotify/features/products/home/presentation/pages/product_details_page.dart'
    as _i12;
import 'package:spotify/features/products/home/presentation/pages/product_home_page.dart'
    as _i13;
import 'package:spotify/features/splash/presentation/pages/splash_page.dart'
    as _i17;

/// generated route for
/// [_i1.AccessPage]
class AccessRoute extends _i18.PageRouteInfo<void> {
  const AccessRoute({List<_i18.PageRouteInfo>? children})
      : super(
          AccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccessRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccessPage();
    },
  );
}

/// generated route for
/// [_i2.CuponDetailPage]
class CuponDetailRoute extends _i18.PageRouteInfo<CuponDetailRouteArgs> {
  CuponDetailRoute({
    _i19.Key? key,
    required String id,
    required String name,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          CuponDetailRoute.name,
          args: CuponDetailRouteArgs(
            key: key,
            id: id,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'CuponDetailRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CuponDetailRouteArgs>();
      return _i2.CuponDetailPage(
        key: args.key,
        id: args.id,
        name: args.name,
      );
    },
  );
}

class CuponDetailRouteArgs {
  const CuponDetailRouteArgs({
    this.key,
    required this.id,
    required this.name,
  });

  final _i19.Key? key;

  final String id;

  final String name;

  @override
  String toString() {
    return 'CuponDetailRouteArgs{key: $key, id: $id, name: $name}';
  }
}

/// generated route for
/// [_i3.CuponsPage]
class CuponsRoute extends _i18.PageRouteInfo<CuponsRouteArgs> {
  CuponsRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          CuponsRoute.name,
          args: CuponsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CuponsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<CuponsRouteArgs>(orElse: () => const CuponsRouteArgs());
      return _i3.CuponsPage(key: args.key);
    },
  );
}

class CuponsRouteArgs {
  const CuponsRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'CuponsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i18.PageRouteInfo<void> {
  const DashboardRoute({List<_i18.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardPage();
    },
  );
}

/// generated route for
/// [_i5.DiscoverPage]
class DiscoverRoute extends _i18.PageRouteInfo<void> {
  const DiscoverRoute({List<_i18.PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i5.DiscoverPage();
    },
  );
}

/// generated route for
/// [_i6.FavoritesSongsPage]
class FavoritesSongsRoute extends _i18.PageRouteInfo<void> {
  const FavoritesSongsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          FavoritesSongsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesSongsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i6.FavoritesSongsPage();
    },
  );
}

/// generated route for
/// [_i7.FavouritePage]
class FavouriteRoute extends _i18.PageRouteInfo<void> {
  const FavouriteRoute({List<_i18.PageRouteInfo>? children})
      : super(
          FavouriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i7.FavouritePage();
    },
  );
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomePage();
    },
  );
}

/// generated route for
/// [_i9.IntermidiatePage]
class IntermidiateRoute extends _i18.PageRouteInfo<void> {
  const IntermidiateRoute({List<_i18.PageRouteInfo>? children})
      : super(
          IntermidiateRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntermidiateRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i9.IntermidiatePage();
    },
  );
}

/// generated route for
/// [_i10.MusicPage]
class MusicRoute extends _i18.PageRouteInfo<MusicRouteArgs> {
  MusicRoute({
    _i19.Key? key,
    required int index,
    required List<dynamic> songsList,
    List<_i18.PageRouteInfo>? children,
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

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MusicRouteArgs>();
      return _i10.MusicPage(
        key: args.key,
        index: args.index,
        songsList: args.songsList,
      );
    },
  );
}

class MusicRouteArgs {
  const MusicRouteArgs({
    this.key,
    required this.index,
    required this.songsList,
  });

  final _i19.Key? key;

  final int index;

  final List<dynamic> songsList;

  @override
  String toString() {
    return 'MusicRouteArgs{key: $key, index: $index, songsList: $songsList}';
  }
}

/// generated route for
/// [_i11.OnboardingPage]
class OnboardingRoute extends _i18.PageRouteInfo<void> {
  const OnboardingRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i11.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i12.ProductDetailsPage]
class ProductDetailsRoute extends _i18.PageRouteInfo<void> {
  const ProductDetailsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProductDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProductDetailsPage();
    },
  );
}

/// generated route for
/// [_i13.ProductHomePage]
class ProductHomeRoute extends _i18.PageRouteInfo<void> {
  const ProductHomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProductHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductHomeRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i13.ProductHomePage();
    },
  );
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i14.ProfilePage();
    },
  );
}

/// generated route for
/// [_i15.SigninPage]
class SigninRoute extends _i18.PageRouteInfo<SigninRouteArgs> {
  SigninRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SigninRoute.name,
          args: SigninRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SigninRouteArgs>(orElse: () => const SigninRouteArgs());
      return _i15.SigninPage(key: args.key);
    },
  );
}

class SigninRouteArgs {
  const SigninRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'SigninRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.SignupPage]
class SignupRoute extends _i18.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignupRouteArgs>(orElse: () => const SignupRouteArgs());
      return _i16.SignupPage(key: args.key);
    },
  );
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.SplashPage]
class SplashRoute extends _i18.PageRouteInfo<void> {
  const SplashRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i17.SplashPage();
    },
  );
}
