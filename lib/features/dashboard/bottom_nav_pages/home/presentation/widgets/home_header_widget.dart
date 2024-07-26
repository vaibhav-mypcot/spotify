import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/constants/constatnts.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: kColorBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60.h,
                width: 40.w,
                // color: kColorGrey,
                padding: EdgeInsets.all(7.h),
                margin: EdgeInsets.only(top: 4.h),
                child: SvgPicture.asset(
                  Constatnts.searchIC,
                  fit: BoxFit.contain,
                  height: 18.h,
                  width: 18.w,
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  // Handle the menu item selection
                  print('Selected: $value');
                },
                itemBuilder: (BuildContext context) {
                  return {'Item 1', 'Item 2', 'Item 3'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  Constatnts.spotifyLogo,
                  fit: BoxFit.cover,
                  height: 34.h,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
