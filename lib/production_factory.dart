import 'package:sheeran/arch/abstract_factory.dart';
import 'package:sheeran/arch/storage_interface.dart';
import 'package:sheeran/arch/requester_interface.dart';
import 'package:sheeran/arch/api_agent_interface.dart';

class ProductionFactory implements AbstractFactory {
  @override
  IApiAgent get apiAgent => throw UnimplementedError();

  @override
  IRequester get requester => throw UnimplementedError();

  @override
  IStorage get storage => throw UnimplementedError();
}
