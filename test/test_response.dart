import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/arch/resource_status.dart';
import 'package:sheeran/arch/response.dart';

void testResponse() {
  test('Parse valid response', () {
    final data = <String, dynamic>{
      'status': 'success',
      'message': 'This is a valid response.',
    };
    final raw = jsonEncode(data);
    final response = Response.fromString(raw);
    expect(response.status, ResourceStatus.ok);
    expect(response.message, 'This is a valid response.');
    expect(response.data, data);
  });

  test('Parse valid error response', () {
    final data = <String, dynamic>{
      'status': 'error',
      'message': 'This is a valid "error" response.',
    };
    final raw = jsonEncode(data);
    final response = Response.fromString(raw);
    expect(response.status, ResourceStatus.error);
    expect(response.message, 'This is a valid "error" response.');
    expect(response.data, data);
  });

  test('Parse invalid response', () {
    final data = <String, dynamic>{
      'no': 'status or message',
    };
    final raw = jsonEncode(data);
    final response = Response.fromString(raw);
    expect(response.status, ResourceStatus.parseError);
    expect(response.message, 'Failed to parse response data.');
    expect(response.data, <String, dynamic>{});
  });
}
