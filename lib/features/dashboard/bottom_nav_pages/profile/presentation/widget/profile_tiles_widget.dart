import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/routes/app_router.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/init_dependencies.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget(
      {super.key, required this.tilesNameList, required this.index});

  final List tilesNameList;
  final int index;

  pageNavigation(int index) {
    if (index == 0) {
      serviceLocator<AppRouter>().push(CuponsRoute());
    } else if (index == 1) {
      serviceLocator<AppRouter>().push(const FavoritesSongsRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Clicked ${tilesNameList[index]}");
        pageNavigation(index);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tilesNameList[index],
              style: TextStyle(fontSize: 16.sp),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
