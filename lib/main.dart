import 'package:entrega2/pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:entrega2/pages/list_page.dart';
import 'package:entrega2/pages/save_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: SavePage.ROUTE, routes: {
      ListPage.ROUTE: (_) => ListPage(),
      SavePage.ROUTE: (_) => SavePage()
    });
  }
}
