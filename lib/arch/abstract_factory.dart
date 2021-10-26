import 'package:sheeran/arch/api_agent_base.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/storage_interface.dart';

abstract class AbstractFactory {
  ApiAgentBase get apiAgent;
  IStorage get storage;
  IRequester get requester;
}
