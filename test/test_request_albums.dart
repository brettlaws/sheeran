import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/imp/rest_api_agent.dart';

import 'mock/mock_album_builder.dart';
import 'mock/mock_requester.dart';

void testRequestAlbums() {
  test('Request albums', () async {
    final agent =
        RestApiAgent(requester: MockRequester(), builder: MockAlbumBuilder());
    final result = await agent.fetchAlbums();
    expect(result == null, false);
    expect(result?.length, 3);
  });
}
