import 'package:json_annotation/json_annotation.dart';

import 'auth/auth_response.dart';

part 'base.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> {
  @_Converter()
  String? status;
  int? statusCode;
  String? message;
  T? data;

  BaseModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory BaseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) functionE) =>
      _$BaseModelFromJson(json, functionE);

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BaseModelToJson(this, toJsonT);
}

class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T? fromJson(Object? json) {
    if (json == null) return null;

    if (json is List) {
      if (json.isNotEmpty) {
        var item = json.first;
        //  if (item is Map<String, dynamic> &&
        //       item.containsKey('ref') &&
        //       item.containsKey("channel_name") &&
        //       item.containsKey('approvalStatus') &&
        //       item.containsKey('amount'))
        //     return json
        //         .map((i) => VoucherEntity.fromJson(i as Map<String, dynamic>))
        //         .toList() as T;
        //   else if (item is Map<String, dynamic> &&
        //       item.containsKey('faq') &&
        //       item.containsKey("answer") &&
        //       item.containsKey('id'))
        //     return json
        //         .map((i) => FaqEntity.fromJson(i as Map<String, dynamic>))
        //         .toList() as T;
        //   else if (item is Map<String, dynamic> &&
        //       item.containsKey('payment_ref') &&
        //       item.containsKey("fullname") &&
        //       item.containsKey('amount'))
      } else {
        return null;
      }
    } else {
      if (json is Map<String, dynamic>) {
        if (json.containsKey('user') &&
            json.containsKey('expires_in') &&
            json.containsKey('token')) {
          return AuthResponse.fromJson(json) as T?;
        }
        // else if (json.containsKey('id') &&
        //     json.containsKey('profile_picture') &&
        //     json.containsKey('role') &&
        //     !json.containsKey('delivery_details')) {
        //   return UserEntity.fromJson(json) as T?;
        // } else if (json.containsKey('data')&&!json.containsKey('delivery_details')) {
        //   return DynamicResponse.fromJson(json) as T?;
      } else {
        return json as T?;
      }
    }
    return null;
  }

  @override
  Object toJson(T? object) {
    if (object == null) return {};
    return (object as dynamic).toJson();
  }
}
