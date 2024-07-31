import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/utils/utils.dart';
import 'package:spotify/features/music/presentation/bloc/song_player/song_player_bloc.dart';
import 'package:spotify/features/music/presentation/bloc/position/position_bloc.dart';

class SongPlayerWidget extends StatefulWidget {
  SongPlayerWidget({
    super.key,
    required this.position,
    required this.listLength,
    required this.songsList,
  });

  int? position;
  final int listLength;
  final List songsList;

  @override
  State<SongPlayerWidget> createState() => _SongPlayerWidgetState();
}

class _SongPlayerWidgetState extends State<SongPlayerWidget> {
  bool isShuffleClicked = false;
  bool isRepeateClicked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayerBloc, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ShuffleSongActiveState) {
        if (widget.position == widget.listLength - 1) {
          print('executed');
          widget.position = 0;
        } else {
          widget.position = widget.position! + 1;
        }
        context
            .read<PositionBloc>()
            .add(SkeepToNextPreviousSongEvent(widget.position!));

        context.read<SongPlayerBloc>().add(
              LoadSong(
                Utils.addHyphenInString(
                    widget.songsList[widget.position!].artist),
                Utils.addHyphenInString(
                    widget.songsList[widget.position!].title),
              ),
            );
      } else if (state is RepeatSongActiveState) {
        // if (widget.position == 0) {
        //   widget.position = widget.listLength - 1;
        // } else {
        //   widget.position = widget.position! - 1;
        // }
        context
            .read<PositionBloc>()
            .add(SkeepToNextPreviousSongEvent(widget.position!));

        context.read<SongPlayerBloc>().add(
              LoadSong(
                Utils.addHyphenInString(
                    widget.songsList[widget.position!].artist),
                Utils.addHyphenInString(
                    widget.songsList[widget.position!].title),
              ),
            );
      } else if (state is SongPlayerLoaded) {
        final songPlayerBloc = context.read<SongPlayerBloc>();
        return Column(
          children: [
            Slider(
              value: songPlayerBloc.songPosition.inSeconds.toDouble(),
              min: 0.0,
              max: songPlayerBloc.songDuration.inSeconds.toDouble(),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                songPlayerBloc.add(SeekSong(position));
              },
              thumbColor: kColorBlack,
              activeColor: kColorLightGrey,
              inactiveColor: const Color(0xffAFAFAF),
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Utils.formatDuration(songPlayerBloc.songPosition),
                  ),
                  Text(
                    Utils.formatDuration(songPlayerBloc.songDuration),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SongPlayerBloc, SongPlayerState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('clicked');
                        setState(() {
                          if (isShuffleClicked) {
                            isShuffleClicked = !isShuffleClicked;
                          }
                          isRepeateClicked = !isRepeateClicked;
                        });

                        context
                            .read<SongPlayerBloc>()
                            .add(RepeatSongClickedEvent(isRepeateClicked));

                        context
                            .read<SongPlayerBloc>()
                            .add(ShuffleSongClickedEvent(isShuffleClicked));
                      },
                      child: SvgPicture.asset(
                        Constatnts.repeateIC,
                        fit: BoxFit.cover,
                        color:
                            isRepeateClicked ? kColorPrimary : kColorLightGrey,
                      ),
                    ),
                    SizedBox(width: 40.h),
                    GestureDetector(
                      onTap: () {
                        if (widget.position == 0) {
                          print('executed');
                          widget.position = widget.listLength - 1;
                        } else {
                          widget.position = widget.position! - 1;
                        }

                        context.read<PositionBloc>().add(
                            SkeepToNextPreviousSongEvent(widget.position!));

                        context.read<SongPlayerBloc>().add(
                              LoadSong(
                                Utils.addHyphenInString(
                                    widget.songsList[widget.position!].artist),
                                Utils.addHyphenInString(
                                    widget.songsList[widget.position!].title),
                              ),
                            );
                      },
                      child: SvgPicture.asset(
                        Constatnts.arrowIC,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 40.h),
                    GestureDetector(
                      onTap: () => songPlayerBloc.add(PlayOrPauseSong()),
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kColorPrimary,
                        ),
                        child: Icon(
                          songPlayerBloc.audioPlayer.playing
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                    SizedBox(width: 40.h),
                    GestureDetector(
                      onTap: () {
                        if (widget.position == widget.listLength - 1) {
                          print('executed');
                          widget.position = 0;
                        } else {
                          widget.position = widget.position! + 1;
                        }
                        context.read<PositionBloc>().add(
                            SkeepToNextPreviousSongEvent(widget.position!));

                        context.read<SongPlayerBloc>().add(
                              LoadSong(
                                Utils.addHyphenInString(
                                    widget.songsList[widget.position!].artist),
                                Utils.addHyphenInString(
                                    widget.songsList[widget.position!].title),
                              ),
                            );
                      },
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(
                          Constatnts.arrowIC,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 40.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isRepeateClicked) {
                            isRepeateClicked = !isRepeateClicked;
                          }
                          isShuffleClicked = !isShuffleClicked;
                        });

                        context
                            .read<SongPlayerBloc>()
                            .add(ShuffleSongClickedEvent(isShuffleClicked));

                        context
                            .read<SongPlayerBloc>()
                            .add(RepeatSongClickedEvent(isRepeateClicked));
                      },
                      child: SvgPicture.asset(
                        Constatnts.shuffleIC,
                        fit: BoxFit.cover,
                        color:
                            isShuffleClicked ? kColorPrimary : kColorLightGrey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      }
      return const SizedBox();
    });
  }
}
