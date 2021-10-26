import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/album_data_builder_interface.dart';

class ItunesAlbumBuilder implements IAlbumDataBuilder {
  @override
  List<Album>? buildAlbumData(Map<String, dynamic> data) {
    final albums = <Album>[];
    try {
      for (dynamic object in data['results']) {
        if (object['collectionType'] == 'Album') {
          final Album newAlbum = Album(
            name: object['collectionName'],
            image: Image.network(object['artworkUrl100']),
            priceUSD: object['collectionPrice'],
            releaseDate: DateTime.parse(object['releaseDate']),
          );
          albums.add(newAlbum);
        }
      }
    } catch (e) {
      print('Error parsing response.');
    }
    return albums;
  }
}
