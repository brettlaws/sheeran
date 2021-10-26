import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/config.dart';

import 'albums_page.dart';
import 'spacing.dart';

class Home extends StatelessWidget {
  const Home() : super(key: const Key('Home'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.blueGrey[50],
          fontSize: 20,
        ),
        backgroundColor: Colors.blueGrey[400],
        title: const Text('Ed Sheeran App'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Space.spaceBetween([
            const Text(
              'Welcome to my app!',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const Text(
              'Press "go" below to browse Ed Sheeran\'s Albums',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            ElevatedButton(
                key: const Key('Go button'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => AlbumsPage()));
                },
                child: const Text('Go')),
          ], const EdgeInsets.only(bottom: 20)),
        ),
      ),
    );
  }
}
