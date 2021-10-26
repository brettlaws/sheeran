import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/album_data_builder_interface.dart';
import 'package:sheeran/arch/api_agent_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/resource_status.dart';

import 'albums_request.dart';

class RestApiAgent implements IApiAgent {
  RestApiAgent({required this.requester, required this.builder});

  final IRequester requester;
  final IAlbumDataBuilder builder;

  @override
  Future<List<Album>?> fetchAlbums() async {
    final r = await requester.request(AlbumsRequest());
    if (r.status != ResourceStatus.ok) {
      return null;
    } else {
      return builder.buildAlbumData(r.data);
    }
  }
}
