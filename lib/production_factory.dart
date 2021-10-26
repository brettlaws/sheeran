import 'package:sheeran/arch/abstract_factory.dart';
import 'package:sheeran/arch/storage_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/api_agent_base.dart';
import 'package:sheeran/imp/itunes_api_agent.dart';
import 'package:sheeran/imp/local_storage.dart';
import 'package:sheeran/imp/net_resource_requester.dart';

class ProductionFactory implements AbstractFactory {
  @override
  ApiAgentBase get apiAgent => ItunesApiAgent();

  @override
  IRequester get requester => NetResourceRequester();

  @override
  IStorage get storage => LocalStorage();
}
