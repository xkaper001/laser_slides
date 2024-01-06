import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reorderable_staggered_scroll_view/reorderable_staggered_scroll_view.dart';

import '../../features/widgetCatalogue/widgets_catalogue.dart';
import '../../common_widgets/buttons.dart';
import '../../data/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final Future<SharedPreferences> getPrefs = SharedPreferences.getInstance();
  late Future<List<String>?> buttonList;

  @override
  void initState() {
    super.initState();
    buttonList = getDB();
  }

  Future<List<String>?> getDB() async {
    Database.initializePreferences(getPrefs);
    return await Database.getButtons(getPrefs);
  }

  @override
  Widget build(BuildContext context) {
    // get
    int getCrossAxisCount() {
      final width = MediaQuery.of(context).size.width;
      // final height = MediaQuery.of(context).size.height;
      if (width >= 1200) {
        return 8;
      } else if (width >= 1000) {
        return 6;
      } else if (width >= 800) {
        return 4;
      }
      return 0;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<String>?>(
            future: buttonList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ReorderableStaggeredScrollView.grid(
                  children: [
                    CommandButton.widget(
                      context: context,
                      text: '2x2 Button',
                      height: 2,
                      width: 2,
                    )
                  ],
                  crossAxisCount: 8,
                );
              }
            }),
      ),
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
