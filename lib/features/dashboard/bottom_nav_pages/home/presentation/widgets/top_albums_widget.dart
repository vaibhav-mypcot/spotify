import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';
import 'package:shimmer/shimmer.dart';

class TopAlbumsWidget extends StatelessWidget {
  const TopAlbumsWidget({
    super.key,
    required this.topAlbums,
  });

  final List topAlbums;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: topAlbums.length,
      itemBuilder: (ctx, index) {
        print(
            "link: ${'${Constatnts.appUrl}${topAlbums[index].artist} - ${topAlbums[index].title}.png?${Constatnts.mediaAlt}'}");
        String formattedArtist = topAlbums[index].artist.replaceAll(' ', '_');
        String formattedTitle = topAlbums[index].title.replaceAll(' ', '_');
        return GestureDetector(
          onTap: () {
            //context.read<TabsBloc>().add(TabClickEvent(index));
          },
          child: GestureDetector(
            onTap: () {
              context.router.push(MusicRoute(
                index: index,
                songsList: topAlbums,
              ));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 198.h,
                    width: 146.h,
                    decoration: BoxDecoration(
                        // color: kColorBlack,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'cover$index',
                          child: Container(
                            height: 184.h,
                            width: 146.h,
                            decoration: BoxDecoration(
                                color: kColorPrimary,
                                borderRadius: BorderRadius.circular(30.r),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        '${Constatnts.appUrl}$formattedArtist$formattedTitle.png?${Constatnts.mediaAlt}'))),
                          ),
                        ),
                        Container(
                          // color: kColorLightGrey,
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(right: 12.w),
                          child: Image.asset(
                            Constatnts.playButton,
                            fit: BoxFit.cover,
                            height: 34.h,
                            width: 34.w,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          topAlbums[index].title,
                          style: kTextStyleSatoshiBold600.copyWith(
                              fontSize: 16.sp),
                        ),
                        Text(
                          (topAlbums[index].artist.length > 14)
                              ? topAlbums[index].artist.substring(0, 14)
                              : topAlbums[index].artist,
                          style: kTextStyleSatoshiMedium500.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget ShimmeTopAlbumsWidget() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 4,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 188.h,
                width: 146.h,
                // padding: EdgeInsets.only(),
                // margin: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 8.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 8.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
