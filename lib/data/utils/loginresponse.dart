class LoginResponse {
  Map<String,dynamic>? user;
  String? accessToken;

  LoginResponse({ this.user,  this.accessToken});

  LoginResponse.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        accessToken = json['accessToken'];
}