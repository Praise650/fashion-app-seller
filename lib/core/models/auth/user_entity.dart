import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: "role_id")
  final int? roleId;
  @JsonKey(name: "email_verified_at")
  final DateTime? emailVerifiedAt;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "fcm_token")
  final String? fcmToken;

  UserEntity(
      {this.id,
      this.name,
      this.email,
      this.roleId,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.fcmToken});

  UserEntity copyWith(
      int? id,
      String? name,
      String? email,
      int? roleId,
      DateTime? emailVerifiedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? fcmToken) {
    return UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        roleId: roleId ?? this.roleId,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  // factory UserEntity.fromJson(Map<String, dynamic> json) {
  //   return UserEntity(
  //     id: json['id'] as int?,
  //     name: json['name'] as String?,
  //     email: json['email'] as String?,
  //     role_id: json['role_id'] as int?,
  //     email_verified_at: json['email_verified_at'] as DateTime?,
  //     created_at: json['created_at'] as DateTime?,
  //     updated_at: json['updated_at'] as DateTime?,
  //     fcm_token: json['fcm_token'] as String?,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "name": name,
  //     "email": email,
  //     "role_id": role_id,
  //     "email_verified_at": email_verified_at,
  //     "created_at": created_at,
  //     "updated_at": updated_at,
  //     "fcm_token": fcm_token,
  //   };
  // }
}
