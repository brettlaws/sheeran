class Request {
  Request({
    required this.resource,
    required this.data,
  });

  final String resource;
  final Map<String, dynamic> data;
}
