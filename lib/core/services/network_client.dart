import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../app/res/api_urls.dart';
import '../routes/router.dart';
import '../routes/routes.dart';
import 'api_service.dart';

final logger = Logger(
  filter: ProductionFilter(), // Only log in debug mode
  printer: PrettyPrinter(
    methodCount: 2, // Number of method calls to be displayed
    errorMethodCount: 8, // Number of method calls if stacktrace is provided
    lineLength: 120, // Width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: true, // Should each log print contain a timestamp
  ),
  output: ConsoleOutput(), // Use the default console output
  level: Level.debug, // Log all messages at or above this level
);

class NetworkClient {
  static NetworkClient _instance = NetworkClient._internal();
  static NetworkClient get instance => _instance;

  late Dio _dio;
  late ApiService _client;
  final Duration _timeout = const Duration(milliseconds: 25 * 1000);

  NetworkClient._internal({String? authToken}) {
    logger.e("User Token: $authToken");
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.developmentBaseUrl,
      ),
    );
    _dio.options.responseType = ResponseType.json;
    _dio.options.contentType = "application/json";
    _dio.options.headers["Accept"] = "application/vnd.api+json";
    _dio.options.headers["content-type"] = "application/json";
    _dio.options.headers["Authorization"] = "Bearer $authToken";
    _dio.options.connectTimeout = _timeout;
    _dio.options.receiveTimeout = _timeout;
    _dio.options.sendTimeout = _timeout;
    _dio.options.validateStatus = (status) => true;
    // Accept all status codes and handle them manually
    // Or if you only want to handle 4xx errors:
    // return status! < 500;
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        // onRequest: _requestInterceptor,
        onResponse: _responseInterceptor,
        onError: _errorInterceptor,
      ),
    );
    logger.e("About to set client");
    _client = ApiService(_dio, baseUrl: ApiUrls.developmentBaseUrl);
    logger.e("Done setting client");
  }

  ApiService get client => _client;

  void reset(String authToken) {
    _instance = NetworkClient._internal(authToken: authToken);
    logger.i("User Token: $authToken");
  }

  Future<void> _responseInterceptor(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    // Check the response body for success flag
    if (response.data is Map && response.data['status'] == "failed") {
      // Convert it to an error response
      final error = DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        message: response.data['message'],
      );

      // Log the error
      logger.e('🚫 API Error: ${error.message} and status code: ${error.response?.statusCode}');

      if (error.response?.statusCode == 422) {
        // Extract the errors
        Map<String, dynamic> errors = (response.data['errors']);
        // Extract only the values (error messages)
        List<String> errorMessages = errors.values.toList().cast<String>();
        // Join the error messages into a single string (optional)
        String formattedErrors = errorMessages.join('\n');
        // Print the formatted errors
        logger.e(formattedErrors);
        // AppResponse.showError(formattedErrors);
      } else if (error.response?.statusCode == 403 &&
          error.message!.toLowerCase().contains("invalid token")) {
        // AppResponse.showError("Token Expired, Try to re login ");
        router.push(Paths.LOGIN);
      } else {
        // AppResponse.showError(error.response?.data['message']);
      }

      // Pass to error handler
      handler.reject(error);
      return;
    }

    // Handle actual success responses for 200-299 status codes
    logger.i('✅ Success Response: ${response.data}');
    handler.next(response);
  }

// For 400+ status codes
  Future<void> _errorInterceptor(
      DioException error, ErrorInterceptorHandler handler) async {
    logger.e('⚠️ Error Response: ${error.response?.data}');
    // AppResponse.showError(error.response?.statusMessage ?? "Error occurred");

    final errorPayload = DioException(
      requestOptions: error.requestOptions,
      response: Response(
          requestOptions: error.requestOptions,
          data: error.response?.data, // Just take the payload
          statusCode: error.response?.statusCode),
    );

    handler.next(errorPayload);
  }
}
