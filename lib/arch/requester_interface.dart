import 'request.dart';
import 'response.dart';

abstract class IRequester {
  Future<Response> request(Request request,
      [Duration timeout = const Duration(seconds: 5)]);
}
