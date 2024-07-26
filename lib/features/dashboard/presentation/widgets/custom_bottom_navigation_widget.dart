import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/constants/constatnts.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/features/dashboard/presentation/bloc/bottom_nav_tab_bloc.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  const CustomBottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      color: const Color(0xffFFFFFF),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            bottomIconContainer(
                Constatnts.homeIc, Constatnts.homeFillIc, 'Home', 0, context),
            bottomIconContainer(Constatnts.discoverIc,
                Constatnts.discoverFillIc, 'Market', 1, context),
            bottomIconContainer(Constatnts.heartIc, Constatnts.heartFillIc,
                'Portfolio', 2, context),
            bottomIconContainer(Constatnts.profileIc, Constatnts.profileFillIc,
                'Setting', 3, context),
          ],
        ),
      ),
    );
  }

  Widget bottomIconContainer(
    String icImage,
    String icFillImage,
    String title,
    int index,
    BuildContext context,
  ) {
    return BlocBuilder<BottomNavTabBloc, BottomNavTabState>(
      builder: (context, state) {
        if (state is BottomNavTabInitial) {
          return Column(
            children: [
              (state.index == index)
                  ? Container(
                      width: 30.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: kColorPrimary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.r),
                          bottomRight: Radius.circular(12.r),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 6.h,
                    ),
              InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.r)),
                onTap: () {
                  print(index);
                  context
                      .read<BottomNavTabBloc>()
                      .add(BottomNavTabClickEvent(index));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 0),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        (state.index == index) ? icFillImage : icImage,
                        height: 28.h,
                        width: 28.w,
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
