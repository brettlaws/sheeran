import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/ui/album_tile.dart';
import 'package:sheeran/ui/spacing.dart';

import '../config.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage() : super(key: const Key('AlbumsPage'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: const Text('Ed Sheeran Albums'),
        titleTextStyle: TextStyle(
          color: Colors.blueGrey[50],
          fontSize: 20,
        ),
      ),
      body: Container(
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
          )),
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
      l.add(AlbumTile(data: albums[i], index: i));
    }
    return Space.spaceBetween(l, const EdgeInsets.only(bottom: 20));
  }
}
