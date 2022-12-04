import 'package:flutter/material.dart';
import 'favourite_screen.dart';
import 'categories_screen.dart';
import '../widget/main_drawer.dart';

class BottomTab extends StatefulWidget {
  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  List<Widget> screens = [CategoriesScreen(), Favourite()];
  int ind = 0;
  void whichScreen(int index) {
    setState(() {
      ind = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabs'),
      ),
      drawer: MainDrawer(),
      body: screens[ind],
      bottomNavigationBar: BottomNavigationBar(
        onTap: whichScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: ind,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              label: "Category", icon: Icon(Icons.category)),
          BottomNavigationBarItem(label: "Favourite", icon: Icon(Icons.star))
        ],
      ),
    );
  }
}
