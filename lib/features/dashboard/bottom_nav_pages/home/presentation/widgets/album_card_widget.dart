import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

class AlbumCardWidget extends StatelessWidget {
  AlbumCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  final bannerList = [
    {
      "albumName": "Cold Play",
      "SingerName": "Justin Biber",
      "card-color": "#F6FB7A",
    },
    {
      "albumName": "Uptown Funk",
      "SingerName": "Mark Ronson",
      "card-color": "#91DDCF",
    },
    {
      "albumName": "Shake it off",
      "SingerName": "Taylor Swift",
      "card-color": "#F6FB7A",
    },
  ];

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
              color: Colors.red,
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
                          bannerList[index]['albumName'].toString(),
                          style: kTextStyleSatoshiBold600.copyWith(
                            fontSize: 24.sp,
                            color: kColorWhite,
                          ),
                        ),
                        Text(
                          bannerList[index]['SingerName'].toString(),
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
                Constatnts.luffyPic,
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
