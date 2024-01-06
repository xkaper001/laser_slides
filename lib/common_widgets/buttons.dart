import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:laser_slides/utils/palette.dart';
import 'package:reorderable_staggered_scroll_view/reorderable_staggered_scroll_view.dart';

class CommandButton {
  // Widget for Command Button
  static ReorderableStaggeredScrollViewGridItem widget(
      {required BuildContext context,
      required String text,
      IconData? icon,
      required int height,
      required int width}) {
    var random = Random();
    return ReorderableStaggeredScrollViewGridItem(
      key: const ValueKey(1),
      mainAxisCellCount: height,
      crossAxisCellCount: width,
      widget: Bounceable(
        onTap: () {},
        child: Container(
          // height: 100,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: paletteList[random.nextInt(paletteList.length)],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
              // height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon != null
                  ? Icon(icon)
                  : Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 48),
                      ),
                    )),
        ),
      ),
    );
  }

  // Method to convert data to button
}
