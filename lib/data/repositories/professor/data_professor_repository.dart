import 'dart:convert';

import 'package:ecole_prof/data/utils/constants.dart';
import 'package:ecole_prof/data/utils/loginprofessor.dart';
import 'package:ecole_prof/data/utils/loginresponse.dart';
import 'package:ecole_prof/data/utils/updatepswdrsp.dart';
import 'package:ecole_prof/domain/entities/professor/professor.dart';
import 'package:ecole_prof/domain/repositories/professor/professor_reposirory.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DataProfessorRepository extends ProfessorRepository{
  GetStorage userid = GetStorage();
  GetStorage uid = GetStorage();
  
  @override

    
  Future<Professor> login(String email, String password)async {
    Professor professor;
  
    LoginProfessor logProf = new LoginProfessor(email: email, password: password, type: 'PROFESSOR');
    http.Response response = await http.post(Uri.https(Constant.URL, 'api/v1/auth/login'), body: logProf.toJson());

      if(response.statusCode==201){

        Map<String,dynamic> reqResponse = jsonDecode(response.body);
        LoginResponse lgResponse = new LoginResponse(
          user: reqResponse['user'],
          accessToken: reqResponse['accessToken']);
        professor = Professor.fromJson(lgResponse.user);
        print(' le parent ${professor.toJson()}');
        return professor;
      }
      else if(response.statusCode==403){
            Map<String,dynamic> reqResponse = jsonDecode(response.body);
            userid.write('id', int.parse(reqResponse['error']));
            print('le body response de 403, $reqResponse');

        throw reqResponse;
      }
      else if(response.statusCode == 404){
        Map<String,dynamic> reqResponse = jsonDecode(response.body);
        throw reqResponse;
      }
 
   
  }

  Future<String> updatePassword(String password)async{

    @override
        UpdateResponse u =
        new UpdateResponse(password: password, firstConnexion: false);

    var data = u.toJson();
    print(' on veut voire le contenu de data $data');
    //Ecrire la logique ici
    String message = 'votre mot de passe à bien été mise à jour';
    var id = userid.read('id');

    try {
      http.Response response = await http.patch(
          Uri.http(Constant.URL, 'api/v1/parents/$id'),
          body: u.toJson() //ok essaies ca
          ); //ici ya un soucis

      return message;
    } catch (e) {
      throw e;
    }



  }

} 