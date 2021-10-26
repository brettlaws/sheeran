import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/mock/mock_rest_api_agent.dart';

void testProductionApiAgent() {
  test('Request albums', () async {
    final agent = MockRestApiAgent();
    final result = await agent.fetchAlbums();
    expect(result == null, false);
    expect(result?.length, 3);
  });
}
