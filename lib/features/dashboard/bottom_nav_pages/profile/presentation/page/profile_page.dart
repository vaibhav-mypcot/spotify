import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/common/widgets/common_app_bar_widget.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/profile/presentation/widget/profile_tiles_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.48,
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.r),
                bottomRight: Radius.circular(60.r),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 38.h),
                //-- App bar
                const CommonAppBarWidget(
                  title: 'Profile',
                ),
                SizedBox(height: 20.h),
                Image.asset(
                  Constatnts.profilePic,
                  fit: BoxFit.fitHeight,
                  height: 120.h,
                  width: 120.w,
                ),
                SizedBox(height: 12.h),
                Text(
                  'soroushnorozyui@gmail.com',
                  style: kTextStyleSatoshiRegular400.copyWith(
                    fontSize: 16.sp,
                    color: kColorBlack,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Soroushnrz',
                  style: kTextStyleSatoshiBold600.copyWith(
                    fontSize: 20.sp,
                    color: kColorDarkGrey,
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '778',
                            style: kTextStyleSatoshiBold600.copyWith(
                              fontSize: 20.sp,
                              color: kColorBlack,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: kTextStyleSatoshiRegular400.copyWith(
                              fontSize: 16.sp,
                              color: kColorLightGrey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '243',
                            style: kTextStyleSatoshiBold600.copyWith(
                              fontSize: 20.sp,
                              color: kColorBlack,
                            ),
                          ),
                          Text(
                            'Following',
                            style: kTextStyleSatoshiRegular400.copyWith(
                              fontSize: 16.sp,
                              color: kColorLightGrey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //--- Redeem Cupon
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 24.h, left: 18.w, right: 18.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kColorDarkGrey,
                  width: 0.8.w,
                ),
              ),
            ),
            child: Text(
              "Actions",
              style: TextStyle(
                fontSize: 20.sp,
                color: kColorBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (ctx, index) {
                return ProfileTileWidget(
                  index: index,
                  tilesNameList: const [
                    'Redeem Cupons',
                    'Favorites',
                    'Playlists',
                    'Saved Albums',
                    'Liked Songs',
                    'Shared Albums',
                  ],
                );
              }),
        ],
      ),
    );
  }
}
