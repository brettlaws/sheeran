import 'request_interface.dart';
import 'response.dart';

abstract class IRequester {
  Future<Response> request(IRequest request,
      [Duration timeout = const Duration(seconds: 5)]);
}
