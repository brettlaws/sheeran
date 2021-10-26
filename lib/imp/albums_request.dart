import 'package:sheeran/arch/request_interface.dart';

class AlbumsRequest implements IRequest {
  static const artistId = '183313439';

  @override
  Map<String, dynamic> get data => <String, dynamic>{};

  @override
  String get resource => '/lookup';

  @override
  Map<String, dynamic> get body => <String, dynamic>{};

  @override
  Map<String, dynamic> get queryData => <String, dynamic>{
        'id': artistId,
        'entity': 'album',
      };
}
