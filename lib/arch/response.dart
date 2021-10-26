import 'dart:convert';

import 'package:sheeran/arch/resource_status.dart';

class Response {
  Response({
    required this.data,
    required this.status,
  });

  factory Response.fromData(Map<String, dynamic> data) {
    final String statusValue = data['status'];
    late ResourceStatus _status;
    if (statusValue == 'success') {
      _status = ResourceStatus.ok;
    } else if (statusValue == 'error') {
      _status = ResourceStatus.error;
    } else {
      _status = ResourceStatus.parseError;
    }
    return Response(
      data: data,
      status: _status,
    );
  }

  factory Response.fromString(String raw) {
    try {
      final _data = jsonDecode(raw);
      return Response.fromData(_data);
    } catch (e) {
      return Response(
        data: {},
        status: ResourceStatus.parseError,
      );
    }
  }

  final Map<String, dynamic> data;
  final ResourceStatus status;
}
