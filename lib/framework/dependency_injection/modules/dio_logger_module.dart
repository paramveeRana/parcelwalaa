import 'package:parcelwalaa/framework/dependency_injection/inject.dart';
import 'package:parcelwalaa/framework/provider/network/dio/dio_logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioLoggerModule {
  @LazySingleton(env: Env.environments)
  DioLogger getDioLogger() {
    final dioLogger = DioLogger();
    return dioLogger;
  }
}
