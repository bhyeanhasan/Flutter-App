import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  void gotoHomePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }

  void gotoFilterPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('filter_page');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Drawer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('Home'),
            onTap: () => gotoHomePage(context),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text('Filter'),
            onTap: () => gotoFilterPage(context),
          )
        ],
      ),
    );
  }
}
