import 'package:sheeran/arch/abstract_factory.dart';
import 'package:sheeran/production_factory.dart';

AbstractFactory abstractFactory = ProductionFactory();

void setFactory(AbstractFactory newFactory) {
  abstractFactory = newFactory;
}
