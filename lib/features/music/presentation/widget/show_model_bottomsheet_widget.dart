import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showModelBottomSheet(BuildContext context, String imgUrl) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.amber,
      context: context,
      builder: (context) {
        return Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
          ),
        );
      });
}
