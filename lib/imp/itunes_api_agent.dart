import 'package:sheeran/arch/album_data_builder_interface.dart';
import 'package:sheeran/arch/api_agent_base.dart';
import 'package:sheeran/imp/itunes_album_builder.dart';

class ItunesApiAgent extends ApiAgentBase {
  @override
  IAlbumDataBuilder get builder => ItunesAlbumBuilder();
}
