import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/album_data_builder_interface.dart';
import 'package:sheeran/arch/api_agent_base.dart';
import 'package:sheeran/mock/mock_album_builder.dart';

class MockApiAgent extends ApiAgentBase {
  @override
  IAlbumDataBuilder get builder => MockAlbumBuilder();

  @override
  Future<List<Album>> fetchAlbums() async {
    final albums = <Album>[];
    return albums;
  }
}
