import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/tab_bloc/tabs_bloc.dart';

class TabListWidget extends StatelessWidget {
  const TabListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List tabs = ['Songs', 'Video', 'Artists', 'Podcasts'];
    return BlocBuilder<TabsBloc, TabsState>(
      builder: (context, state) {
        if (state is TabsInitial) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  context.read<TabsBloc>().add(TabClickEvent(index));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    children: [
                      Text(
                        tabs[index],
                        style: kTextStyleSatoshiMedium500.copyWith(
                          fontSize: 20.h,
                          color: kColorBlack,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      (state.index == index)
                          ? Container(
                              width: 26.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: kColorPrimary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.r),
                                  bottomRight: Radius.circular(8.r),
                                ),
                              ),
                            )
                          : Container(
                              height: 4.h,
                            ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
