import 'package:integration_test/integration_test.dart';
import 'package:sheeran/mock/test_factory.dart';
import 'package:sheeran/production_factory.dart';

import 'test_favorite.dart';
import 'test_local_storage.dart';
import 'test_production_api_agent.dart';
import 'test_request_albums.dart';
import 'test_response.dart';
import 'package:sheeran/config.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  abstractFactory = UnitTestFactory();

  testResponse();
  testLocalStorage();
  testRequestAlbums();
  testFavorite();

  abstractFactory = ProductionFactory();

  testProductionApiAgent();
}
