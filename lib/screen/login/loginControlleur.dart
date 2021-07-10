import 'package:ecole_prof/data/repositories/professor/data_professor_repository.dart';
import 'package:ecole_prof/domain/entities/professor/professor.dart';
import 'package:ecole_prof/screen/Home/home.dart';
import 'package:ecole_prof/screen/updatepsw/update_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class LoginController extends GetxController {
   
  bool tasking = false;
  final profRep = Get.put(DataProfessorRepository());

 http.Response response;

 
  GetStorage enfants = GetStorage();
  GetStorage uid = GetStorage();
  login(String email, String password) async {
    Professor professor;
    
    // print('value before $tasking');
    tasking = true;
    update();
    try {
      professor = await profRep.login(email, password);
     
      print('le parent est $professor');
      print('l\'id parent est ${professor.id}');
      Get.offAll(Home());
      // Get.off(LoginScreen());

    } catch (e) {
      print('voici l\'erreur $e');
      if (e['statusCode'] == 403) {
        uid.write('eid', int.parse(e["error"]));
        print('On imprime $e');
        Get.to(UpdatePswd());
      } else {
        Get.snackbar('Erreur', e['message'],
            colorText: Color(0xFFffffff),
            backgroundColor: Color(0xFFf2142b),
            duration: Duration(seconds: 4),
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.GROUNDED);
      }
    }
    print('value after $tasking');
  }

}


