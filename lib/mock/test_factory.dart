import 'package:sheeran/arch/abstract_factory.dart';
import 'package:sheeran/arch/storage_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/api_agent_base.dart';
import 'package:sheeran/imp/local_storage.dart';
import 'package:sheeran/mock/mock_rest_api_agent.dart';
import 'package:sheeran/mock/mock_album_builder.dart';
import 'package:sheeran/mock/mock_api_agent.dart';
import 'package:sheeran/mock/mock_requester.dart';

class UnitTestFactory implements AbstractFactory {
  @override
  ApiAgentBase get apiAgent => MockApiAgent();

  @override
  IRequester get requester => MockRequester();

  @override
  IStorage get storage => LocalStorage();
}

class IntegrationTestFactory implements AbstractFactory {
  @override
  ApiAgentBase get apiAgent => MockRestApiAgent();

  @override
  IRequester get requester => MockRequester();

  @override
  IStorage get storage => LocalStorage();
}
