// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:parcelwalaa/framework/dependency_injection/modules/dio_api_client.dart'
    as _i278;
import 'package:parcelwalaa/framework/dependency_injection/modules/dio_logger_module.dart'
    as _i142;
import 'package:parcelwalaa/framework/provider/network/dio/dio_client.dart'
    as _i295;
import 'package:parcelwalaa/framework/provider/network/dio/dio_logger.dart'
    as _i204;

const String _debug = 'debug';
const String _production = 'production';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioLoggerModule = _$DioLoggerModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i204.DioLogger>(
      () => dioLoggerModule.getDioLogger(),
      registerFor: {_debug, _production},
    );
    gh.lazySingleton<_i295.DioClient>(
      () => networkModule.getDebugDioClient(gh<_i204.DioLogger>()),
      registerFor: {_production},
    );
    gh.lazySingleton<_i295.DioClient>(
      () => networkModule.getProductionDioClient(gh<_i204.DioLogger>()),
      registerFor: {_debug},
    );
    return this;
  }
}

class _$DioLoggerModule extends _i142.DioLoggerModule {}

class _$NetworkModule extends _i278.NetworkModule {}
