import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:parcelwalaa/framework/provider/network/api_end_points.dart';
import 'package:parcelwalaa/framework/provider/network/dio/common_error_model.dart';
import 'package:parcelwalaa/framework/provider/network/network_exception.dart';
import 'package:parcelwalaa/main.dart';
import 'package:parcelwalaa/ui/utils/app_constants.dart';


bool enableLogoutDialog = true;

InterceptorsWrapper networkInterceptor() {
  CancelToken cancelToken = CancelToken();
  return InterceptorsWrapper(
    onRequest: (request, handler) {
      List<String> apiEndPointWhereTokenNotRequired = [];
      for (var apiEndPoint in apiEndPointWhereTokenNotRequired) {
        if (request.uri.path == (apiEndPoint)) {
          request.headers.remove('Authorization');
        }
      }
      request.cancelToken = cancelToken;
      handler.next(request);
    },
    onResponse: (response, handler) {
      print("response.realUri.path>>>>${response.realUri.path}");
      List<String> whiteListAPIs = ['/country/export', '/odigo/package/wallet/transaction/export/list'];
      try {
        if ((!whiteListAPIs.contains(response.realUri.path)) && (response.data is Map || (response.data is String && response.data.toString().isNotEmpty))) {
          CommonErrorModel commonModel = CommonErrorModel.fromJson(jsonDecode(response.toString()));
          if (commonModel.status != ApiEndPoints.apiStatus_200 /*&& commonModel.status != 500*/ ) {
            if (globalNavigatorKey.currentState?.context != null) {
              handler.next(response);
              return;
            }
          } else if (commonModel.status == 500) {
            // globalRef!.read(navigationStackController).pushAndRemoveAll(const NavigationStackItem.error(errorType: ErrorType.error403));
          }
        }
        handler.next(response);
      } catch (e) {
        // AppConstants.constant.showLog('${AppConstants.stacktrace} $s');
        handler.reject(DioException(requestOptions: response.requestOptions, response: response, error: const NetworkExceptions.unexpectedError()), false);
      }
    },
    onError: (error, handler) {
      final response = error.response;

      print("object onErroronError ${error.response}");
      List<String> whiteListAPIs = [];
      try {
        if ((!whiteListAPIs.contains(response?.realUri.path)) &&
            /// If bytes is error response
            error.requestOptions.responseType == ResponseType.bytes?
        (utf8.decode(response?.data).isNotEmpty)
        /// String respose
            :(response?.data is Map || (response?.data is String && response!.data.toString().isNotEmpty))
        ) {
          CommonErrorModel commonModel = CommonErrorModel.fromJson(jsonDecode(error.requestOptions.responseType == ResponseType.bytes ? utf8.decode(response?.data): response.toString()));          if (commonModel.status != ApiEndPoints.apiStatus_200) {
            if (globalNavigatorKey.currentState?.context != null) {
              // showErrorDialogue(
              //   context: globalNavigatorKey.currentContext!,
              //   dismissble: true,
              //   buttonText: LocaleKeys.keyOk.localized,
              //   onTap: ()
              //   {
              //     Navigator.pop(globalNavigatorKey.currentContext!);
              //   },
              //   animation: Assets.anim.animErrorJson.keyName,
              //   successMessage:
              //   commonModel.errorMessage == null ? (commonModel.message ?? '') : (commonModel.errorMessage ?? ''),
              //
              // );
              handler.reject(error);
              return;
            }
            else{
              var errorData = NetworkExceptions.getDioException(error);
              String errorMsg = NetworkExceptions.getErrorMessage(errorData);
              if (globalNavigatorKey.currentState?.context != null) {
                // showErrorDialogue(
                //     context: globalNavigatorKey.currentContext!,
                //     dismissble: true,
                //     buttonText: LocaleKeys.keyOk.localized,
                //     onTap: ()
                //     {
                //       Navigator.pop(globalNavigatorKey.currentContext!);
                //     },
                //     animation: Assets.anim.animErrorJson.keyName,
                //     successMessage:errorMsg
                // );

                return;
              }

            }
            handler.reject(error);
          }
        }
        // handler.next(response as DioException);
        handler.next(error);

      } catch (e) {

        handler.reject(
          DioException(requestOptions: response!.requestOptions, response: response, error: const NetworkExceptions.unexpectedError()),
        );
      }
      handler.next(error);
    },
  );
}
