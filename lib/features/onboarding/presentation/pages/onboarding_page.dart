import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: kColorWhite,
        body: Stack(
          children: [
            Image.asset(
              Constatnts.introBg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: 60.h,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.h),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Constatnts.spotifyLogo,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enjoy Listening To Music',
                  style: kTextStyleSatoshiMedium500.copyWith(
                    fontSize: 24.sp,
                    color: kColorWhite,
                  ),
                ),
                SizedBox(height: 22.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 38.w),
                  child: Text(
                    'ELorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    textAlign: TextAlign.center,
                    style: kTextStyleSatoshiRegular400.copyWith(
                      fontSize: 16.sp,
                      color: kColorGrey,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GestureDetector(
                    onTap: () => context.router.replace(const AccessRoute()),
                    child: Container(
                      height: 80.h,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kColorPrimary,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        'Get Started',
                        style: kTextStyleSatoshiMedium500.copyWith(
                          color: kColorWhite,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
