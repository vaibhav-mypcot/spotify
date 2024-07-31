import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/common/widgets/common_app_bar_widget.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';
import 'package:spotify/core/utils/utils.dart';
import 'package:spotify/features/music/presentation/bloc/song_player/song_player_bloc.dart';
import 'package:spotify/features/music/presentation/bloc/position/position_bloc.dart';
import 'package:spotify/features/music/presentation/widget/my_draggable_sheet_widget.dart';
import 'package:spotify/features/music/presentation/widget/song_player_widget.dart';

@RoutePage()
class MusicPage extends StatefulWidget {
  const MusicPage({
    super.key,
    required this.index,
    required this.songsList,
  });

  final int index;
  final List songsList;

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  int position = 0;
  String? formattedArtist;
  String? formattedTitle;
  bool isRepeatClicked = false;
  bool isShuffleClicked = false;

  @override
  void initState() {
    super.initState();
    position = widget.index;
    context.read<SongPlayerBloc>().add(
          LoadSong(
            Utils.addHyphenInString(widget.songsList[position].artist),
            Utils.addHyphenInString(widget.songsList[position].title),
          ),
        );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kColorWhite,
      body: BlocBuilder<PositionBloc, PositionState>(
        builder: (context, state) {
          if (state is SkeepToNextPreviousSongState) {
            position = state.indexPosition;
            print('Position updated: $position ');
          }
          formattedArtist =
              Utils.addHyphenInString(widget.songsList[position].artist);
          formattedTitle =
              Utils.addHyphenInString(widget.songsList[position].title);
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 38.h),
                    //-- App bar
                    const CommonAppBarWidget(),

                    SizedBox(height: 20.h),
                    //--  cover image
                    Hero(
                      tag: 'cover${widget.index}',
                      child: Container(
                        height: screenHeight * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: kColorPrimary,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${Constatnts.appUrl}$formattedArtist$formattedTitle.png?${Constatnts.mediaAlt}'),
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
                              widget.songsList[position].title,
                              style: kTextStyleSatoshiBold600.copyWith(
                                fontSize: 20.sp,
                                color: kColorBlack,
                              ),
                            ),
                            Text(
                              widget.songsList[position].artist,
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
                    SizedBox(height: 30.h),
                    SongPlayerWidget(
                      position: position,
                      songsList: widget.songsList,
                      listLength: widget.songsList.length,
                    ),
                    // _songPlayer(context, widget.index),
                    SizedBox(height: 50.h),
                    // GestureDetector(
                    //   onTap: () {
                    //     // const MyDraggableSheetWidget();
                    //   },
                    //   child: Column(
                    //     children: [
                    //       RotatedBox(
                    //         quarterTurns: 3,
                    //         child: Icon(
                    //           Icons.arrow_forward_ios_rounded,
                    //           size: 24.h,
                    //           color: kColorBlack,
                    //         ),
                    //       ),
                    //       Text(
                    //         'Lyrics',
                    //         style: kTextStyleSatoshiMedium500.copyWith(
                    //           fontSize: 16.sp,
                    //           color: kColorDarkGrey,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              //-- DraggableScrollableSheet
              const MyDraggableSheetWidget(),
            ],
          );
        },
      ),
    );
  }

  // Widget _songPlayer(BuildContext context, int index) {
  //   return BlocBuilder<SongPlayerBloc, SongPlayerState>(
  //       builder: (context, state) {
  //     if (state is SongPlayerLoading) {
  //       return const Center(child: CircularProgressIndicator());
  //     } else if (state is SongPlayerLoaded) {
  //       final songPlayerBloc = context.read<SongPlayerBloc>();
  //       return Column(
  //         children: [
  //           Slider(
  //             value: songPlayerBloc.songPosition.inSeconds.toDouble(),
  //             min: 0.0,
  //             max: songPlayerBloc.songDuration.inSeconds.toDouble(),
  //             onChanged: (value) {
  //               final position = Duration(seconds: value.toInt());
  //               songPlayerBloc.add(SeekSong(position));
  //             },
  //             thumbColor: kColorBlack,
  //             activeColor: kColorLightGrey,
  //             inactiveColor: const Color(0xffAFAFAF),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 Utils.formatDuration(songPlayerBloc.songPosition),
  //               ),
  //               Text(
  //                 Utils.formatDuration(songPlayerBloc.songDuration),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 20),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   print('clicked');
  //                   setState(() {
  //                     isRepeatClicked = !isRepeatClicked;
  //                   });
  //                   print("is clicked: $isRepeatClicked");
  //                 },
  //                 child: SvgPicture.asset(
  //                   Constatnts.repeateIC,
  //                   fit: BoxFit.cover,
  //                   color: isRepeatClicked ? kColorPrimary : kColorLightGrey,
  //                 ),
  //               ),
  //               SizedBox(width: 40.h),
  //               GestureDetector(
  //                 onTap: () {
  //                   print('here is ur position value: $position');
  //                   setState(() {
  //                     if (position == 0) {
  //                       print('executed');
  //                       position = widget.songsList.length - 1;
  //                     } else {
  //                       position -= 1;
  //                     }
  //                     loadSong(position);
  //                   });
  //                   // songPlayerBloc.add(SkeepToNextSong(widget.index));
  //                 },
  //                 child: SvgPicture.asset(
  //                   Constatnts.arrowIC,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               SizedBox(width: 40.h),
  //               GestureDetector(
  //                 onTap: () => songPlayerBloc.add(PlayOrPauseSong()),
  //                 child: Container(
  //                   height: 60.h,
  //                   width: 60.w,
  //                   decoration: const BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: kColorPrimary,
  //                   ),
  //                   child: Icon(
  //                     songPlayerBloc.audioPlayer.playing
  //                         ? Icons.pause
  //                         : Icons.play_arrow,
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 40.h),
  //               GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     if (position == widget.songsList.length - 1) {
  //                       print('executed');
  //                       position = 0;
  //                     } else {
  //                       position += 1;
  //                     }
  //                     loadSong(position);
  //                   });
  //                   // songPlayerBloc.add(SkeepToPreviousSong(widget.index));
  //                 },
  //                 child: RotatedBox(
  //                   quarterTurns: 2,
  //                   child: SvgPicture.asset(
  //                     Constatnts.arrowIC,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 40.h),
  //               GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     isShuffleClicked = !isShuffleClicked;
  //                   });
  //                 },
  //                 child: SvgPicture.asset(
  //                   Constatnts.shuffleIC,
  //                   fit: BoxFit.cover,
  //                   color: isShuffleClicked ? kColorPrimary : kColorLightGrey,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     }
  //     return const SizedBox();
  //   });
  // }
}
