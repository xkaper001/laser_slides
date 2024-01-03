import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void widgetsCatalogueBottomSheet(BuildContext context, TickerProvider vsync) {
  showModalBottomSheet(
    context: context,
    transitionAnimationController: AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 1),
    ),
    builder: (context) {
      return StaggeredGrid.extent(
        maxCrossAxisExtent: 3,
        children: const [],
      );
    },
  );
}
