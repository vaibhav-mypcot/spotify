import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/common/widgets/common_app_bar_widget.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

@RoutePage()
class MusicPage extends StatelessWidget {
  const MusicPage({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  final int index;
  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 28.h),
            //-- App bar
            const CommonAppBarWidget(),

            SizedBox(height: 20.h),
            //--  cover image
            Hero(
              tag: 'cover$index',
              child: Container(
                height: screenHeight * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: kColorPrimary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kTextStyleSatoshiBold600.copyWith(
                        fontSize: 20.sp,
                        color: kColorBlack,
                      ),
                    ),
                    Text(
                      artist,
                      style: kTextStyleSatoshiRegular400.copyWith(
                        fontSize: 18.sp,
                        color: kColorDarkGrey,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite_border_outlined,
                  size: 24.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
