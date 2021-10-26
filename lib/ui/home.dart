import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheeran/config.dart';

import 'albums_page.dart';
import 'spacing.dart';

class Home extends StatelessWidget {
  const Home() : super(key: const Key('Home'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Space.spaceBetween([
            const Text('Welcome to my app!'),
            const Text('Press "go" below to browse Ed Sheeran\'s Albums'),
            ElevatedButton(
                onPressed: () async {
                  final albums = await abstractFactory.apiAgent.fetchAlbums();
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
