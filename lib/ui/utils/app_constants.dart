import 'package:flutter/cupertino.dart';

class AppConstants{
  AppConstants._();

  static const String productionBaseUrl = 'productionBaseUrl';

  static AppConstants constant = AppConstants._();

  ///Show Log
  showLog(String str) {
    debugPrint('-> $str');
  }

  /// Hide Keyboard
  static hideKeyboard(BuildContext context){
    FocusScope.of(context).unfocus();
  }


  static const String accept = 'Accept';
  static const String headerAccept = 'application/json';
  static const String contentType = 'contentType';
  static const String headerContentType = 'application/json';
  static const String acceptLanguage = 'Accept-Language';
  static const String production = 'production';
  static const String development = 'development';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String responseType = 'responseType';
  static const String followRedirects = 'followRedirects';
  static const String connectTimeout = 'connectTimeout';
  static const String receiveTimeout = 'receiveTimeout';
  static const String headers = 'Headers';
  static const String extras = 'Extras';
  static const String queryParameters = 'Query Parameters';
  static const String get = 'GET';
  static const String body = 'Body';
  static const String formData = 'Form data';
  static const String dioError = 'DioError';
  static const String status = 'Status:';
  static const int initialTabNumber = 1;
  static const int dioLoggerMaxWidth = 90;
  static const String response = 'Response';
  static const String requestText = 'Request';
  static const Null nullValue = null;
  static const String nullString = 'null';
  static const String emptyString = '{}';
  static const String error = 'error';
  static const String stacktrace = 'stacktrace';

}

const String unknown = 'Unknown';
const String receivedInvalidStatusCode = 'Received invalid status code:';
const String socketException = 'SocketException';
const String formatException = 'FormatException';
const String isNotaSubtypeOf = 'is not a subtype of';
const String notImplemented = 'Not Implemented';
const String requestCancelled = 'Request Cancelled';
const String internalServerError = 'Internal Server Error';
const String serviceUnavailable = 'Service unavailable';
const String methodAllowed = 'Method Allowed';
const String badRequest = 'Bad request';
const String unauthorizedRequest = 'Unauthorized request';
const String unexpectedErrorOccurred = 'Unexpected error occurred';
const String connectionRequestTimeout = 'Connection request timeout';
const String noInternetConnection = 'No internet connection';
const String errorDueToaConflict = 'Error due to a conflict';
const String sendTimeoutInConnectionWithAPIServer = 'Send timeout in connection with API server';
const String unableToProcessTheData = 'Unable to process the data';
const String formatExceptionSomethingWentWrongWithData = 'FormatException something went wrong with data';
const String notAcceptable = 'Not acceptable';
const String badeCertificate = 'Bade Certificate';
const String connectionError = 'Connection error';
