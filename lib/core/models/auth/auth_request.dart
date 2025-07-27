class AuthRequest {
  final String? email;
  final String? password;

  AuthRequest({this.email, this.password});

  factory AuthRequest.fromJson(Map<String, dynamic> json) {
    return AuthRequest(
      email: json["email"] as String?,
      password: json["password"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  @override
  String toString() {
    return "AuthRequest( email: $email, password: $password)";
  }
}
