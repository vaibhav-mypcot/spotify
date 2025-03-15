import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/common/widgets/loader_widget.dart';
import 'package:spotify/core/common/widgets/show_snackbar_widget.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/song_bloc/song_bloc.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/widgets/album_card_widget.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/widgets/home_header_widget.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/widgets/playlist_card_widget.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/widgets/tab_list_widget.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/widgets/top_albums_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String index = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event) async {
      await remoteConfig.activate();
      setState(() {
        index = remoteConfig.getString("index");
      });
    });
    context.read<SongBloc>().add(SongFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SongBloc, SongState>(listener: (context, state) {
          if (state is SongFailure) {
            showSnackBar(context, "Something went wrong");
          }
        }),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kColorWhite,
          body: Stack(
            children: [
              BlocBuilder<SongBloc, SongState>(
                builder: (context, state) {
                  if (state is SongSuccess) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Stack(
                        // fit: StackFit.expand,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 60.h,
                                  // margin: EdgeInsets.only(top: 0.h),
                                  child: const HomeHeaderWidget(),
                                ),
                                // SizedBox(height: 24.h),
                                //-- Album Card
                                AlbumCardWidget(
                              
                                ),
                                SizedBox(height: 34.h),
                                //-- Tabs
                                SizedBox(
                                  height: 40.h,
                                  width: double.infinity,
                                  child: const TabListWidget(),
                                ),
                                SizedBox(height: 28.h),
                                //-- Top Albums
                                SizedBox(
                                  // height: 40.h,
                                  height: 250.h,
                                  width: double.infinity,
                                  child: TopAlbumsWidget(
                                    topAlbums: state.data,
                                  ),
                                ),
                                SizedBox(height: 36.h),
                                //-- Playlist
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paylist',
                                      style: kTextStyleSatoshiBold600.copyWith(
                                        fontSize: 20.sp,
                                        color: kColorBlack,
                                      ),
                                    ),
                                    Text(
                                      'See More',
                                      style:
                                          kTextStyleSatoshiRegular400.copyWith(
                                        fontSize: 12.sp,
                                        color: kColorDarkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 22.h),

                                PlaylistCardWidget(
                                  topAlbums: state.data,
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   height: 230.h,
                          //   margin: EdgeInsets.only(top: 12.h),
                          //   // color: kColorGrey,
                          //   width: double.infinity,
                          //   alignment: Alignment.bottomRight,
                          //   child: SizedBox(
                          //     child: Image.asset(
                          //       Constatnts.homeArtist,
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
              BlocBuilder<SongBloc, SongState>(builder: (context, state) {
                if (state is SongLoading) {
                  return const LoaderWidget();
                }

                return const SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }
}
