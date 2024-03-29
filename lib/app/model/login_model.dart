import 'dart:convert';

LoginResponse stockQuantityModelFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String stockQuantityModelToJson(LoginResponse data) =>
    json.encode(data.toJson());

class LoginResponse {
  Status status;
  Response response;

  LoginResponse({
    required this.status,
    required this.response,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: Status.fromJson(json["status"]),
        response: Response.fromJson(json["response"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "response": response.toJson(),
      };
}

class Response {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;
  List<dynamic> userRole;
  String tenantName;
  String userType;
  String userId;
  String userName;

  Response({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.expiresIn,
    required this.scope,
    required this.userRole,
    required this.tenantName,
    required this.userType,
    required this.userId,
    required this.userName,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        accessToken: json["access_token"] ?? "",
        tokenType: json["token_type"] ?? "",
        refreshToken: json["refresh_token"] ?? "",
        expiresIn: json["expires_in"] ?? 0,
        scope: json["scope"] ?? "",
        userRole: List<dynamic>.from(json["user_role"] ?? []),
        tenantName: json["tenant_name"] ?? "",
        userType: json["user_type"] ?? "",
        userId: json["user_id"] ?? "",
        userName: json["user_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "scope": scope,
        "user_role": List<dynamic>.from(userRole.map((x) => x)),
        "tenant_name": tenantName,
        "user_type": userType,
        "user_id": userId,
        "user_name": userName,
      };
}

class Status {
  int code;
  dynamic message;

  Status({
    required this.code,
    required this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
