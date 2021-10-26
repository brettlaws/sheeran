import 'package:sheeran/arch/request_interface.dart';

class AlbumsRequest implements IRequest {
  @override
  Map<String, dynamic> get data => <String, dynamic>{};

  @override
  String get resource => '/albums';
}
