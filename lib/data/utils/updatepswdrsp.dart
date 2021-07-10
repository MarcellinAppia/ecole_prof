import 'dart:convert';

UpdateResponse updateresponseFromJson(String str) =>
    UpdateResponse.fromJson(json.decode(str));

String updateresponseToJson(UpdateResponse data) => json.encode(data.toJson());

class UpdateResponse {
  UpdateResponse({
     this.password,
     this.firstConnexion,
  });

  String password;
  bool firstConnexion;

  factory UpdateResponse.fromJson(Map<String, dynamic> json) => UpdateResponse(
        password: json["password"],
        firstConnexion: json["first_connexion"] ,
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "first_connexion": firstConnexion,
      };
}
