import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/album_data_builder_interface.dart';
import 'package:sheeran/arch/api_agent_base.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/resource_status.dart';
import 'package:sheeran/mock/mock_album_builder.dart';
import 'package:sheeran/mock/mock_requester.dart';

class MockRestApiAgent extends ApiAgentBase {
  @override
  IRequester get requester => MockRequester();

  @override
  IAlbumDataBuilder get builder => MockAlbumBuilder();
}
