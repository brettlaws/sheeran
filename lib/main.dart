import 'package:flutter/material.dart';

import 'ui/home.dart';

void main() => runApp(const App());

Widget get app => const App();

class App extends StatelessWidget {
  const App() : super(key: const Key('App'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sheeran Albums',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
