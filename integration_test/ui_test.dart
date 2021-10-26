import 'package:integration_test/integration_test.dart';
import 'package:sheeran/config.dart';
import 'package:sheeran/mock/test_factory.dart';

import 'test_home.dart';

void main() {
  setFactory(TestFactory());
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testHome();
}
