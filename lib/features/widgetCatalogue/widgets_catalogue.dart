import 'package:flutter/material.dart';

void widgetsCatalogueBottomSheet(BuildContext context, TickerProvider vsync) {
  showModalBottomSheet(
      context: context,
      showDragHandle: true,
      transitionAnimationController: AnimationController(
        vsync: vsync,
        duration: const Duration(seconds: 1),
      ),
      builder: (context) {
        return const Text('Widgets Catalogue ');
      });
}
