import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/common/widgets/back_button_widget.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

class CommonAppBarWidget extends StatelessWidget {
  const CommonAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButtonWidget(
          onTap: () {},
        ),
        Text(
          'Now Playing',
          style: kTextStyleSatoshiBold600.copyWith(
            fontSize: 18.sp,
            color: kColorBlack,
          ),
        ),
        PopupMenuButton(
            itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    // row with 2 children
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Get The App")
                      ],
                    ),
                  ),
                  // PopupMenuItem 2
                  const PopupMenuItem(
                    value: 2,
                    // row with two children
                    child: Row(
                      children: [
                        Icon(Icons.chrome_reader_mode),
                        SizedBox(
                          width: 10,
                        ),
                        Text("About")
                      ],
                    ),
                  ),
                ])
      ],
    );
  }
}
