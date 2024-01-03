import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:laser_slides/features/widgetCatalogue/widgets_catalogue.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: stagg,
      floatingActionButton: Bounceable(
        onTap: () {},
        child: Builder(builder: (context) {
          return FloatingActionButton.extended(
            onPressed: () => widgetsCatalogueBottomSheet(context, this),
            label: const Text('Buttons'),
            icon: const Icon(Icons.widgets_rounded),
          );
        }),
      ),
    );
  }
}
