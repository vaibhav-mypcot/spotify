import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/common/widgets/custom_text_field.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

@RoutePage()
class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: kColorWhite,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48.h),
                Text(
                  'Search',
                  style: kTextStyleSatoshiBold600.copyWith(
                    fontSize: 32.sp,
                    color: kColorBlack,
                  ),
                ),
                SizedBox(height: 14.h),
                CustomTextfield(
                  prefixIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Icon(
                      Icons.search_sharp,
                      size: 24.sp,
                    ),
                  ),
                  hintText: 'What do want to listen to?',
                ),
                SizedBox(height: 18.h),
                Text(
                  'Browse all',
                  style: kTextStyleSatoshiBold600.copyWith(
                    fontSize: 18.sp,
                    color: kColorBlack,
                  ),
                ),
                SizedBox(height: 18.h),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14.0,
                      mainAxisSpacing: 18.0,
                    ),
                    itemCount: 12,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Container(
                        height: 20.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            color: kColorGrey,
                            borderRadius: BorderRadius.circular(8.r)),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
