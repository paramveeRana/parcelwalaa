import 'package:dio/dio.dart';
import 'package:parcelwalaa/framework/dependency_injection/inject.dart';
import 'package:parcelwalaa/framework/provider/network/dio/dio_client.dart';
import 'package:parcelwalaa/framework/provider/network/dio/dio_logger.dart';
import 'package:parcelwalaa/framework/provider/network/dio/network_interceptor.dart';
import 'package:parcelwalaa/ui/utils/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @LazySingleton(env: [Env.debug])
  DioClient getProductionDioClient(DioLogger dioLogger) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.productionBaseUrl,
        sendTimeout: const Duration(milliseconds: 500000),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(milliseconds: 500000),
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(dioLogger);
    }
    dio.interceptors.add(networkInterceptor());
    final client = DioClient(dio);
    return client;
  }

  @LazySingleton(env: [Env.production])
  DioClient getDebugDioClient(DioLogger dioLogger) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.productionBaseUrl,
        sendTimeout: const Duration(milliseconds: 500000),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(milliseconds: 500000),
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(dioLogger);
    }
    dio.interceptors.add(networkInterceptor());
    final client = DioClient(dio);
    return client;
  }
}
