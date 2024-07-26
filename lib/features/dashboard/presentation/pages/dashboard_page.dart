import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/discover/presentation/discover_page.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/favourite/presentation/favourite_page.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/page/home_page.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/profile/presentation/profile_page.dart';
import 'package:spotify/features/dashboard/presentation/bloc/bottom_nav_tab_bloc.dart';
import 'package:spotify/features/dashboard/presentation/widgets/custom_bottom_navigation_widget.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: kColorWhite,
        bottomNavigationBar: const CustomBottomNavigationWidget(),
        body: BlocBuilder<BottomNavTabBloc, BottomNavTabState>(
            builder: (ctx, state) {
          if (state is BottomNavTabInitial) {
            if (state.index == 0) {
              return const HomePage();
            } else if (state.index == 1) {
              return const DiscoverPage();
            } else if (state.index == 2) {
              return const FavouritePage();
            } else if (state.index == 3) {
              return const ProfilePage();
            }
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
