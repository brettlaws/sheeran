import 'package:sheeran/arch/api_agent_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/storage_interface.dart';

abstract class AbstractFactory {
  IApiAgent get apiAgent;
  IStorage get storage;
  IRequester get requester;
}
