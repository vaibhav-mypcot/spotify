import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  // @override
  void initState() {
    super.initState();
    redirect(context);
    // _controller = AnimationController(
    //   duration: const Duration(seconds: (3)),
    //   vsync: this,
    // );
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
        body:
            // SizedBox(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   child: Lottie.asset(
            //     'assets/json/jj.json',
            //     // height: 400,
            //     // width: 100,
            //     fit: BoxFit.cover,
            //     controller: _controller,
            //     animate: true,
            //     frameRate: FrameRate.max,
            //     onLoaded: (composition) {
            //       _controller
            //         ..duration = composition.duration
            //         ..forward().whenComplete(() async {
            //           //Check the user logged in status here and then navigate
            //           isAnimationComplete = true;
            //           checkNavigation(context);
            //         });
            //     },
            //   ),
            // ),
            Center(
          child: SvgPicture.asset(
            Constatnts.spotifyLogo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
