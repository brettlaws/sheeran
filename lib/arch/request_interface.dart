abstract class IRequest {
  String get resource;
  Map<String, dynamic> get queryData;
  Map<String, dynamic> get body;
  Map<String, dynamic> get data;
}
