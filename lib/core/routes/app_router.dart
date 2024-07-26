import 'package:auto_route/auto_route.dart';
import 'package:spotify/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: IntermidiateRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: AccessRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: SignupRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: SigninRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: MusicRoute.page,
          // initial: true,
        ),
      ];
}
