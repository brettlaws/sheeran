import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/config.dart';

void testProductionApiAgent() {
  test('Request albums', () async {
    final agent = abstractFactory.apiAgent;
    final result = await agent.fetchAlbums();
    expect(result == null, false);
    expect(result?.length, 50);
  });
}
