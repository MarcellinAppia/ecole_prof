import 'dart:convert';



Professor professorFromJson(String str) => Professor.fromJson(json.decode(str));

String professorToJson(Professor data) => json.encode(data.toJson());

class Professor {
    Professor({
         this.email,
         this.password,
         this.type,
         this.id,
         this.nom,
         this.prenom,
         this.addresse,
         this.tel,
         this.picture,
         this.firstconnection,

    });

    String email;
    String password;
    String type;
    int id;
    String nom;
    String prenom;
    String addresse;
    String tel;
    String picture;
    bool firstconnection;

    factory Professor.fromJson(Map<String, dynamic> json) => Professor(
        email: json["email"],
        password: json["password"],
        type: json["type"],
        id: json["id"],
        nom: json["Nom"],
        prenom: json["prenom"],
        addresse: json["addresse"],
        tel: json["tel"],
        picture: json["picture"],
        firstconnection: json["first_connection"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "type": type,
        "id": id,
        "Nom": nom,
        "prenom": prenom,
        "addresse": addresse,
        "tel": tel,
        "picture": picture,
      "first_connection": firstconnection,
    };
}