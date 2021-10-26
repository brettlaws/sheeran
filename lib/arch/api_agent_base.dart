import 'package:sheeran/config.dart';
import 'package:sheeran/imp/albums_request.dart';

import 'album.dart';
import 'album_data_builder_interface.dart';
import 'requester_interface.dart';
import 'resource_status.dart';

abstract class ApiAgentBase {
  IAlbumDataBuilder get builder;

  IRequester get requester => abstractFactory.requester;

  Future<List<Album>?> fetchAlbums() async {
    final r = await requester.request(AlbumsRequest());
    if (r.status != ResourceStatus.ok) {
      return null;
    } else {
      return builder.buildAlbumData(r.data);
    }
  }
}
