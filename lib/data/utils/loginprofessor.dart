class LoginProfessor{
  String? email;
  String? password;
  String? type;

  LoginProfessor({ this.email, this.password, this.type});

 Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'type': type,
      };

}