import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/features/access/presentation/pages/access_page.dart';
import 'package:spotify/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:spotify/features/onboarding/presentation/pages/onboarding_page.dart';

@RoutePage()
class IntermidiatePage extends StatelessWidget {
  const IntermidiatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const DashboardPage();
          } else {
            return const OnboardingPage();
          }
        });
  }
}
