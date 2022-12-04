import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Item'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [Text('Filter')],
      ),
    );
  }
}
