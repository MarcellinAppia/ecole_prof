import 'package:ecole_prof/data/repositories/professor/data_professor_repository.dart';
import 'package:ecole_prof/domain/entities/professor/professor.dart';
import 'package:ecole_prof/screen/Home/home.dart';
import 'package:ecole_prof/screen/login/loginControlleur.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpdatePassWordController extends GetxController {
  bool answer = false;
  final Login = Get.put(LoginController());
  final dataRep = Get.find<DataProfessorRepository>();

  GetStorage uid = GetStorage();

 


  updatePassword(String password) async {
    Professor professor;
    print('$answer');
    answer = true;
    update();

    try {
      var id= uid.read('eid');
      String pswd = await dataRep.updatePassword(password);
      print('$pswd');
          Get.to(()=>Home());
    } catch (e) {
      print('$e');
      answer = false;
      update();
            Get.snackbar('Erreur', 'erreur de modification',
            colorText: Color(0xFFffffff),
            backgroundColor: Color(0xFFf2142b),
            duration: Duration(seconds: 4),
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.GROUNDED);
      
    }
  }
}
