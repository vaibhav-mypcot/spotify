import 'package:flutter/material.dart';

void showModelBottomSheet(BuildContext context, String imgUrl) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.amber,
      context: context,
      builder: (context) {
        return Container(
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
