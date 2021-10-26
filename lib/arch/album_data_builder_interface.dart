import 'package:sheeran/arch/album.dart';

abstract class IAlbumDataBuilder {
  List<Album>? buildAlbumData(Map<String, dynamic> data);
}
