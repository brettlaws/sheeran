import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/album_data_builder_interface.dart';

class ItunesAlbumBuilder implements IAlbumDataBuilder {
  @override
  List<Album>? buildAlbumData(Map<String, dynamic> data) {
    final albums = <Album>[];
    for (dynamic object in data['results']) {
      if (object['collectionType'] != null) {
        if (object['collectionType'] == 'Album') {
          final Album newAlbum = Album(
            name: object['collectionName'] ?? 'unknown',
            image: Image.network(
              object['artworkUrl100'],
              errorBuilder: (c, o, s) {
                return const Center(
                  child: Text(
                    'Artwork unavailable',
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            priceUSD: object['collectionPrice'] ?? 0,
            releaseDate: DateTime.parse(object['releaseDate']),
          );
          albums.add(newAlbum);
        }
      }
    }
    return albums;
  }
}
