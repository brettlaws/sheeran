import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/api_agent_interface.dart';

class MockApiAgent implements IApiAgent {
  @override
  Future<List<Album>> fetchAlbums() async {
    final albums = <Album>[];
    return albums;
  }
}
