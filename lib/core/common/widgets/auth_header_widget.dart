import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/constants/constatnts.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     BackButtonWidget(onTap: () => context.router.back()),
        //   ],
        // ),
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
