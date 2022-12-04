import 'package:flutter/material.dart';
import '../screen/categories_screen.dart';
import '../screen/favourite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Foods'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: "Category",
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: "Favourite",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [CategoriesScreen(), Favourite()],
          ),
        ));
  }
}
