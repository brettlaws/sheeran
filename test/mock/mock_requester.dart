import 'dart:math';

import 'package:sheeran/arch/request_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/response.dart';

class MockRequester implements IRequester {
  @override
  Future<Response> request(IRequest request,
      [Duration timeout = const Duration(seconds: 5)]) async {
    final route = request.resource;
    switch (route) {
      case '/albums':
        return Response.fromData({
          'status': 'success',
          'message': 'Successfully fetched album data.',
          'albums': [
            {
              'name': 'album-A',
              'image':
                  'https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png',
              'releaseDate': _genReleaseDateMs(),
              'priceUSD': (10 + Random().nextInt(15)).toDouble(),
            },
            {
              'name': 'album-B',
              'image':
                  'https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png',
              'releaseDate': _genReleaseDateMs(),
              'priceUSD': (10 + Random().nextInt(15)).toDouble(),
            },
            {
              'name': 'album-C',
              'image':
                  'https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png',
              'releaseDate': _genReleaseDateMs(),
              'priceUSD': (10 + Random().nextInt(15)).toDouble(),
            }
          ],
        });
      default:
        return Response.fromData({
          'status': 'error',
          'message': 'Invalid route.',
        });
    }
  }

  int _genReleaseDateMs() {
    final nowMs = DateTime.now().millisecond;
    const daysInYear = 365;
    const maxYearsAgo = 10;
    final deltaMs = Duration(days: daysInYear * Random().nextInt(maxYearsAgo))
        .inMilliseconds;
    return nowMs - deltaMs;
  }
}
