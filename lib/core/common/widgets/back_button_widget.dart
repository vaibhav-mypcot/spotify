import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/theme/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: const BoxDecoration(
          color: kColorGrey,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Icon(
            Icons.arrow_back_ios,
            size: 14.h,
          ),
        ),
      ),
    );
  }
}
