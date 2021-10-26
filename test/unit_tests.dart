import 'package:integration_test/integration_test.dart';

import '../lib/mock/test_factory.dart';
import 'test_favorite.dart';
import 'test_local_storage.dart';
import 'test_request_albums.dart';
import 'test_response.dart';
import 'package:sheeran/config.dart';

void main() async {
  abstractFactory = UnitTestFactory();

  testResponse();
  testLocalStorage();
  testRequestAlbums();
  testFavorite();
}
