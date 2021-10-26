import 'dart:math';

import 'package:sheeran/arch/request.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/response.dart';

class MockRequester implements IRequester {
  @override
  Future<Response> request(Request request,
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
              'releaseData': _genReleaseDate(),
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

  String _genReleaseDate() {
    final nowMs = DateTime.now().millisecond;
    const daysInYear = 365;
    const maxYearsAgo = 10;
    final deltaMs = Duration(days: daysInYear * Random().nextInt(maxYearsAgo))
        .inMilliseconds;
    final releaseDate = DateTime.fromMillisecondsSinceEpoch(nowMs - deltaMs);
    return '${releaseDate.month}/${releaseDate.day}/${releaseDate.year}';
  }
}
