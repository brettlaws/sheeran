import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/favorite_saver.dart';
import 'package:sheeran/ui/album_tile.dart';
import 'package:sheeran/ui/spacing.dart';

import '../config.dart';

class AlbumsPage extends StatelessWidget {
  AlbumsPage() : super(key: const Key('AlbumsPage'));

  final _controller = StreamController<int>.broadcast();

  void _initFavorites() {
    FavoriteSaver().numFavorites.then((value) => _controller.add(value));
  }

  @override
  Widget build(BuildContext context) {
    _initFavorites();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey[400],
        title: StreamBuilder<int>(
          initialData: 0,
          stream: _controller.stream.distinct(),
          builder: (c, s) {
            String val = '0';
            if (s.hasData &&
                s.connectionState == ConnectionState.active &&
                s.data != null) {
              val = s.data.toString();
            }
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Ed Sheeran albums liked: ' + val),
            );
          },
        ),
        titleTextStyle: TextStyle(
          color: Colors.blueGrey[50],
          fontSize: 20,
        ),
      ),
      body: _AlbumBody(() {
        FavoriteSaver().numFavorites.then((value) => _controller.add(value));
      }),
    );
  }
}

class _AlbumBody extends StatelessWidget {
  const _AlbumBody(this.updateFavorites);

  final Function() updateFavorites;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('Album list'),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: FutureBuilder<List<Album>>(
        initialData: const [],
        future: _albums,
        builder: (c, s) {
          if (s.hasData) {
            return SingleChildScrollView(
                child: Column(children: _children(context, s.data ?? [])));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Album>> get _albums async {
    final albums = await abstractFactory.apiAgent.fetchAlbums();
    albums?.sort((a, b) {
      return a.releaseDate.millisecondsSinceEpoch -
          b.releaseDate.millisecondsSinceEpoch;
    });
    return albums ?? [];
  }

  List<Widget> _children(BuildContext context, List<Album> albums) {
    final l = <Widget>[];
    for (int i = 0; i < albums.length; i++) {
      l.add(AlbumTile(
          data: albums[i], index: i, updateFavorites: updateFavorites));
    }
    return Space.spaceBetween(l, const EdgeInsets.only(bottom: 20));
  }
}
