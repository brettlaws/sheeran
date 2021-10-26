import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/ui/album_tile.dart';
import 'package:sheeran/ui/spacing.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage(this.albums) : super(key: const Key('AlbumsPage'));

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Ed Sheeran Albums'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          key: const Key('Album list'),
          child: Column(
            children: _children(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _children(BuildContext context) {
    final l = <Widget>[];
    for (Album album in albums) {
      l.add(AlbumTile(data: album));
    }
    return Space.spaceBetween(l, const EdgeInsets.only(bottom: 30));
  }
}
