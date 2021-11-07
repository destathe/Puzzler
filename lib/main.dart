import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyHomePage.dart';
import 'pieces.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Pieces(),
      child: MaterialApp(
        title: '8Puzzles',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: '8PUzzles'),
      ),
    );
  }
}
