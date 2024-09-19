import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/song_bloc/song_bloc.dart';

class PlaylistCardWidget extends StatelessWidget {
  const PlaylistCardWidget({super.key, required this.topAlbums});

  final List topAlbums;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(
      builder: (context, state) {
        if (state is SongSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                String formattedArtist =
                    topAlbums[index].artist.replaceAll(' ', '_');
                String formattedTitle =
                    topAlbums[index].title.replaceAll(' ', '_');
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Image.asset(
                          //   Constatnts.playButton,
                          //   fit: BoxFit.cover,
                          //   height: 34.h,
                          //   width: 34.w,
                          // ),
                          Container(
                            height: 80.h,
                            width: 80.h,
                            decoration: BoxDecoration(
                                color: kColorPrimary,
                                borderRadius: BorderRadius.circular(30.r),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        '${Constatnts.appUrl}$formattedArtist$formattedTitle.png?${Constatnts.mediaAlt}'))),
                          ),
                          SizedBox(width: 24.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.data[index].title,
                                style: kTextStyleSatoshiBold600.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack,
                                ),
                              ),
                              SizedBox(height: 2.w),
                              Text(
                                (state.data[index].artist.length > 14)
                                    ? state.data[index].artist.substring(0, 14)
                                    : state.data[index].artist,
                                style: kTextStyleSatoshiRegular400.copyWith(
                                  fontSize: 14.sp,
                                  color: kColorBlack,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            state.data[index].duration
                                .toString()
                                .replaceAll('.', ':'),
                            style: kTextStyleSatoshiRegular400.copyWith(
                              fontSize: 16.sp,
                              color: kColorBlack,
                            ),
                          ),
                          SizedBox(width: 18.w),
                          Icon(
                            Icons.favorite_outlined,
                            size: 22.h,
                          )
                        ],
                      )
                    ],
                  ),
                );
              });
        }
        return const SizedBox();
      },
    );
  }
}
