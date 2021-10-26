import 'album.dart';

abstract class IApiAgent {
  Future<List<Album>> fetchAlbums();
}
