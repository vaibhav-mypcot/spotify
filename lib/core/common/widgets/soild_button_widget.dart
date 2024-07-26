import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/theme/text_style.dart';

class SolidButtonWidget extends StatelessWidget {
  const SolidButtonWidget({
    super.key,
    this.height,
    this.filledColor,
    required this.labelColor,
    required this.fontSize,
    this.borderColor,
    required this.label, required this.onTap,
  });

  final double? height;
  final Color? filledColor;
  final Color labelColor;
  final double fontSize;
  final Color? borderColor;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: filledColor ?? Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(18.r),
          ),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: kTextStyleSatoshiMedium500.copyWith(
            fontSize: fontSize.sp,
            color: labelColor,
          ),
        ),
      ),
    );
  }
}
