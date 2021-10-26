import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:sheeran/arch/request_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/resource_status.dart';
import 'package:sheeran/arch/response.dart';

class NetResourceRequester implements IRequester {
  NetResourceRequester({this.baseUrl = 'https://itunes.apple.com/'}) {
    _dio = dio.Dio(dio.BaseOptions(baseUrl: baseUrl));
  }

  final String baseUrl;
  late dio.Dio _dio;

  @override
  Future<Response> request(IRequest request,
      [Duration timeout = const Duration(seconds: 5)]) async {
    final dio.Response res =
        await _dio.get(request.resource, queryParameters: request.queryData);
    return Response(
      data: jsonDecode(res.data),
      status: res.statusCode == 200 ? ResourceStatus.ok : ResourceStatus.error,
    );
  }
}
