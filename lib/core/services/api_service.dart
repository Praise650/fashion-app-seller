import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/res/api_urls.dart';
import '../models/auth/auth_request.dart';
import '../models/auth/auth_response.dart';
import '../models/base.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiUrls.developmentBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiUrls.login)
  Future<BaseModel<AuthResponse>> login(@Body() AuthRequest login);
  @POST(ApiUrls.register)
  Future<BaseModel<AuthResponse>> register(@Body() AuthRequest register);
  @POST(ApiUrls.verifyOtp)
  Future<BaseModel<AuthResponse>> verifyOtp(@Body() AuthRequest verifyOtp);
  @POST(ApiUrls.resendOtp)
  Future<BaseModel<AuthResponse>> resendOtp(@Body() AuthRequest resendOtp);
  @PUT(ApiUrls.updatePassword)
  Future<BaseModel<AuthResponse>> updatePassword(@Body() AuthRequest updatePassword);

  @POST(ApiUrls.forgetPassword)
  Future<BaseModel<AuthResponse>> forgetPassword(@Field('email') String email);
  @POST(ApiUrls.resetPassword)
  Future<BaseModel<AuthResponse>> resetPassword(@Body() AuthRequest resetPassword);

// upload-profile-picture
//   @MultiPart()
//   @POST('/upload-profile-picture')
//   Future<BaseModel<Map<String, dynamic>>> uploadProfilePicture(
//     @Part(name: 'image', contentType: 'image/png') File image,
//   );
}

// _data.fields.addAll(checkoutRequest
//     .toJson()
//     .entries
//     .where((entry) => entry.value != null)
//     .map((e) => MapEntry(e.key, e.value)));
//
// @override
// Future<BaseModel<CalcPrice>> calcPrice(CheckoutRequest calc) async {
//   final _extra = <String, dynamic>{};
//   final queryParameters = <String, dynamic>{};
//   queryParameters.removeWhere((k, v) => v == null);
//   final _headers = <String, dynamic>{};
//   final _data = FormData();
//   _data.fields.addAll(calc
//       .toJson()
//       .entries
//       .where((entry) => entry.value != null)
//       .map((e) => MapEntry(e.key, e.value)));
//   final _result = await _dio.fetch<Map<String, dynamic>>(
//       _setStreamType<BaseModel<CalcPrice>>(Options(
//     method: 'POST',
//     headers: _headers,
//     extra: _extra,
//   )
//           .compose(
//             _dio.options,
//             '/delivery/calculate-price',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(
//               baseUrl: _combineBaseUrls(
//             _dio.options.baseUrl,
//             baseUrl,
//           ))));
//   final _value = BaseModel<CalcPrice>.fromJson(
//     _result.data!,
//     (json) => CalcPrice.fromJson(json as Map<String, dynamic>),
//   );
//   return _value;
// }
//
// @override
// Future<BaseModel<Map<String, dynamic>>> checkout(
//   CheckoutRequest checkoutRequest,
//   List<File>? itemImages,
//   List<File>? itemImagesTwo,
// ) async {
//   final _extra = <String, dynamic>{};
//   final queryParameters = <String, dynamic>{};
//   queryParameters.removeWhere((k, v) => v == null);
//   final _headers = <String, dynamic>{};
//   final _data = FormData();
//   _data.fields.addAll(checkoutRequest
//       .toJson()
//       .entries
//       .where((entry) => entry.value != null)
//       .map((e) => MapEntry(e.key, e.value)));
//   if (itemImages != null) {
//     _data.files.addAll(itemImages.map((i) => MapEntry(
//         'items[0][images][]',
//         MultipartFile.fromFileSync(
//           i.path,
//           filename: i.path.split(Platform.pathSeparator).last,
//         ))));
//   }
//   if (itemImagesTwo != null) {
//     _data.files.addAll(itemImagesTwo.map((i) => MapEntry(
//         'items[1][images][]',
//         MultipartFile.fromFileSync(
//           i.path,
//           filename: i.path.split(Platform.pathSeparator).last,
//         ))));
//   }
//   final _result = await _dio.fetch<Map<String, dynamic>>(
//       _setStreamType<BaseModel<Map<String, dynamic>>>(Options(
//     method: 'POST',
//     headers: _headers,
//     extra: _extra,
//     contentType: 'multipart/form-data',
//   )
//           .compose(
//             _dio.options,
//             '/delivery/checkout',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(
//               baseUrl: _combineBaseUrls(
//             _dio.options.baseUrl,
//             baseUrl,
//           ))));
//   final _value = BaseModel<Map<String, dynamic>>.fromJson(
//     _result.data!,
//     (json) => (json as Map<String, dynamic>),
//   );
//   return _value;
// }
// @override
// Future<BaseModel<Map<String, dynamic>>> uploadProfilePicture(
//     File image) async {
//   final _extra = <String, dynamic>{};
//   final queryParameters = <String, dynamic>{};
//   final _headers = <String, dynamic>{};
//   final _data = FormData();
//   _data.files.add(MapEntry(
//     'image',
//     MultipartFile.fromFileSync(
//       image.path,
//       filename: image.path.split(Platform.pathSeparator).last,
//       contentType: DioMediaType.parse('image/png'),
//     ),
//   ));
//   final _result = await _dio.fetch<Map<String, dynamic>>(
//       _setStreamType<BaseModel<Map<String, dynamic>>>(Options(
//         method: 'POST',
//         headers: _headers,
//         extra: _extra,
//         contentType: 'multipart/form-data',
//       )
//           .compose(
//         _dio.options,
//         '/upload-profile-picture',
//         queryParameters: queryParameters,
//         data: _data,
//       )
//           .copyWith(
//           baseUrl: _combineBaseUrls(
//             _dio.options.baseUrl,
//             baseUrl,
//           ))));
//   final _value = BaseModel<Map<String, dynamic>>.fromJson(
//     _result.data!,
//         (json) => json as Map<String, dynamic>,
//   );
//   return _value;
// }

// @override
// Future<BaseModel<DynamicResponse>> uploadProof(
//     List<MultipartFile> files,
//     String errandId,
//     ) async {
//   final _extra = <String, dynamic>{};
//   final queryParameters = <String, dynamic>{};
//   final _headers = <String, dynamic>{};
//   final _data = FormData();
//   _data.files.addAll(files.map((i) => MapEntry('proof[]', i)));
//   final _result = await _dio.fetch<Map<String, dynamic>>(
//       _setStreamType<BaseModel<DynamicResponse>>(Options(
//         method: 'POST',
//         headers: _headers,
//         extra: _extra,
//         contentType: 'multipart/form-data',
//       )
//           .compose(
//         _dio.options,
//         '/errand/${errandId}/upload-proof',
//         queryParameters: queryParameters,
//         data: _data,
//       )
//           .copyWith(
//           baseUrl: _combineBaseUrls(
//             _dio.options.baseUrl,
//             baseUrl,
//           ))));
//   final _value = BaseModel<DynamicResponse>.fromJson(
//     _result.data!,
//         (json) => DynamicResponse.fromJson(json as Map<String, dynamic>),
//   );
//   return _value;
// }
