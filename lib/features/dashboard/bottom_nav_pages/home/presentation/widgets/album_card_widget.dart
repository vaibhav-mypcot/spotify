import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

class AlbumCardWidget extends StatelessWidget {
  const AlbumCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String albumTitle = 'Happier Than\nEver';
    return Container(
      // height: 240.h,
      // color: kColorLightGrey,
      child: Stack(
        children: [
          Container(
            // height: 144.h,
            margin: EdgeInsets.only(top: 40.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: kColorPrimary,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // color: kColorBlack,
                    padding: EdgeInsets.only(left: 20.h, top: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Album',
                          style: kTextStyleSatoshiRegular400.copyWith(
                            fontSize: 12.sp,
                            color: kColorWhite,
                          ),
                        ),
                        Text(
                          'Happier Than\nEver',
                          style: kTextStyleSatoshiBold600.copyWith(
                            fontSize: 24.sp,
                            color: kColorWhite,
                          ),
                        ),
                        Text(
                          'Billie Eilish',
                          style: kTextStyleSatoshiRegular400.copyWith(
                            fontSize: 16.sp,
                            color: kColorWhite,
                          ),
                        ),
                        SizedBox(height: 8.h)
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  // color: kColorLightGrey,
                  child: SvgPicture.asset(
                    Constatnts.topPattern,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.redAccent,
            alignment: Alignment.topRight,
            child: SizedBox(
              child: Image.asset(
                Constatnts.homeArtist,
                fit: BoxFit.cover,
                height: 172.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
