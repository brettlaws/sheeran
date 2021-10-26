import 'package:sheeran/arch/abstract_factory.dart';
import 'package:sheeran/arch/storage_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/api_agent_interface.dart';
import 'package:sheeran/imp/local_storage.dart';

import 'mock/mock_api_agent.dart';
import 'mock/mock_requester.dart';

class TestFactory implements AbstractFactory {
  @override
  IApiAgent get apiAgent => MockApiAgent();

  @override
  IRequester get requester => MockRequester();

  @override
  IStorage get storage => LocalStorage();
}
