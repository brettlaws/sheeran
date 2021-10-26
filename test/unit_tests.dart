import 'test_factory.dart';
import 'test_local_storage.dart';
import 'test_request_albums.dart';
import 'test_response.dart';
import 'package:sheeran/config.dart';

void main() {
  abstractFactory = TestFactory();

  testResponse();
  testLocalStorage();
  testRequestAlbums();
}
