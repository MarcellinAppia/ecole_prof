import 'dart:convert';

import 'package:ecole_prof/data/utils/marksforprofessor.dart';



List<Professor> professorFromJson(String str) => List<Professor>.from(json.decode(str).map((x) => Professor.fromJson(x)));

String professorToJson(List<Professor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
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
        this.firstConnection,
       

    });

    String? email;
    String? password;
    String? type;
    int? id;
    String? nom;
    String? prenom;
    String? addresse;
    String? tel;
    String? picture;
    bool? firstConnection;
   

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
       firstConnection: json["first_connection"],
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
      "first_connection": firstConnection,
    };
}