import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/core/theme/text_style.dart';

class MyDraggableSheetWidget extends StatefulWidget {
  const MyDraggableSheetWidget({super.key});

  @override
  State<MyDraggableSheetWidget> createState() =>
      __MyDraggableSheetWidgetState();
}

class __MyDraggableSheetWidgetState extends State<MyDraggableSheetWidget> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  bool isOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.01) {
      _collapse();
    }

    if (currentSize <= 0.0) {
      setState(() {
        isOpen = !isOpen;
      });
    }
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _anchor() => _animateSheet(sheet.snapSizes!.last);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: _sheet,
        initialChildSize: 0.1,
        maxChildSize: 1,
        minChildSize: 0,
        expand: true,
        snap: true,
        snapSizes: [
          90 / constraints.maxHeight,
          1,
        ],
        controller: _controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: kColorLightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                // const SliverToBoxAdapter(
                //   child: Text('Title'),
                // ),
                SliverList.list(
                  children: [
                    Visibility(
                      visible: !isOpen,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 24.h,
                              color: kColorBlack,
                            ),
                          ),
                          Text(
                            'Lyrics',
                            style: kTextStyleSatoshiMedium500.copyWith(
                              fontSize: 16.sp,
                              color: kColorDarkGrey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
