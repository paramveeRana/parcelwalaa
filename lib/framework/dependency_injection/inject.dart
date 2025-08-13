import 'package:parcelwalaa/framework/dependency_injection/inject.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureMainDependencies({required String environment}) async => GetItInjectableX(getIt).init(environment : environment);

abstract class Env{
  static const debug = 'debug';
  static const production = 'production';

  static const List<String> environments = [
    Env.debug,  Env.production
  ];
}