import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:spotify/features/music/presentation/widget/show_model_bottomsheet_widget.dart';
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
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kColorWhite,
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          context.read<PositionBloc>().add(SkeepToNextPreviousSongEvent(-1));
        },
        child: BlocBuilder<PositionBloc, PositionState>(
          builder: (context, state) {
            if (state is SkeepToNextPreviousSongState) {
              if (state.indexPosition != -1) {
                position = state.indexPosition;
                print('Position updated: $position ');
              }
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
                      const CommonAppBarWidget(
                        title: 'Now Playing',
                      ),

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
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('songs')
                                  .doc(widget.songsList[position].id)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (!snapshot.hasData ||
                                    !snapshot.data!.exists) {
                                  return const SizedBox();
                                }

                                // Access the 'isFavorite' field from the document
                                var isFavorite = snapshot.data!['isFavorite'];

                                return IconButton(
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorite ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () {
                                    // Update the isFavorite field when the button is pressed
                                    FirebaseFirestore.instance
                                        .collection('songs')
                                        .doc(widget.songsList[position].id)
                                        .update({
                                      'isFavorite': !isFavorite,
                                    });
                                  },
                                );
                              }),
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
                      //     showModelBottomSheet(context,
                      //         '${Constatnts.appUrl}$formattedArtist$formattedTitle.png?${Constatnts.mediaAlt}');
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
                // const MyDraggableSheetWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
