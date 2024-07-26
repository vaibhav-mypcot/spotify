import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/common/widgets/back_button_widget.dart';
import 'package:spotify/core/common/widgets/soild_button_widget.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

@RoutePage()
class AccessPage extends StatelessWidget {
  const AccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: kColorWhite,
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                Constatnts.topPattern,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                Constatnts.bottomPattern,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: double.infinity,
              // color: Colors.amberAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 36.h),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      child: BackButtonWidget(onTap: () {})),
                  SizedBox(height: 100.h),
                  SvgPicture.asset(
                    Constatnts.spotifyLogo,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 54.h),
                  Text(
                    'Enjoy listening to music',
                    style: kTextStyleSatoshiBold600.copyWith(
                      fontSize: 26.sp,
                      color: kColorBlack,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    textAlign: TextAlign.center,
                    style: kTextStyleSatoshiRegular400.copyWith(
                      fontSize: 16.sp,
                      color: kColorLightGrey,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SolidButtonWidget(
                          onTap: () => context.router.push(SignupRoute()),
                          height: 60.h,
                          filledColor: kColorPrimary,
                          labelColor: kColorWhite,
                          fontSize: 18,
                          label: 'Register',
                        ),
                      ),
                      SizedBox(width: 28.sp),
                      Expanded(
                        child: SolidButtonWidget(
                          onTap: () => context.router.push( SigninRoute()),
                          height: 60.h,
                          labelColor: kColorLightGrey,
                          fontSize: 18,
                          label: 'Sign in',
                          borderColor: kColorLightGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
