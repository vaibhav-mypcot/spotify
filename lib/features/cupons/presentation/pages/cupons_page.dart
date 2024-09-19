import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/core/theme/app_colors.dart';

@RoutePage()
class CuponsPage extends StatelessWidget {
  CuponsPage({super.key});

  List cuponsList = [
    {"id": "1", "title": "Cupon-1"},
    {"id": "2", "title": "Cupon-2"},
    {"id": "3", "title": "Cupon-3"},
    {"id": "4", "title": "Cupon-4"},
    {"id": "5", "title": "Cupon-5"},
    {"id": "6", "title": "Cupon-6"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: AppBar(
        backgroundColor: kColorWhite,
        title: const Text(
          'Cupon',
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: cuponsList.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () => context.router.push(CuponDetailRoute(
                id: cuponsList[index]['id'], name: cuponsList[index]['title'])),
            child: ListTile(
              title: Text(cuponsList[index]['title'].toString()),
            ),
          );
        },
      ),
    );
  }
}
