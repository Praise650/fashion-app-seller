import 'package:json_annotation/json_annotation.dart';

import 'user_entity.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "token")
  final String? authToken;
  @JsonKey(name: "user")
  final UserEntity? userEntity;

  AuthResponse({this.authToken, this.userEntity});

  AuthResponse copyWith(String? authToken, UserEntity? userEntity) {
    return AuthResponse(
      authToken: authToken ?? this.authToken,
      userEntity: userEntity ?? this.userEntity,
    );
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  // factory AuthResponse.from(Map<String, dynamic> json) {
  //   return AuthResponse(
  //     authToken: json["token"] as String?,
  //     userEntity: UserEntity.from(json['user']),
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     "user": userEntity?.toJson(),
  //     "token": authToken,
  //   };
  // }
}
