import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/album_data_builder_interface.dart';

class MockAlbumBuilder implements IAlbumDataBuilder {
  @override
  List<Album>? buildAlbumData(Map<String, dynamic> data) {
    if (data['albums'] == null) {
      return null;
    } else {
      final List<dynamic> albumData = data['albums'];
      final albums = <Album>[];
      for (dynamic element in albumData) {
        try {
          final newAlbum = Album(
            name: element['name'],
            releaseDate:
                DateTime.fromMillisecondsSinceEpoch(element['releaseDate']),
            priceUSD: element['priceUSD'] as double,
            image: Image.network(element['image']),
          );
          albums.add(newAlbum);
        } catch (c) {
          print('Bad Album element, skipping: ' + c.toString());
        }
      }
      return albums;
    }
  }
}
