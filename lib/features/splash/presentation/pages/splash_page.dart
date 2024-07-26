import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect(context);
  }

  Future<void> redirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      context.router.replace(const IntermidiateRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: kColorWhite,
        body: Center(
          child: SvgPicture.asset(
            Constatnts.spotifyLogo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
