import 'package:ecole_prof/screen/updatepsw/updatepswd_content.dart';
import 'package:ecole_prof/screen/updatepsw/updatepswd_controller.dart';
import 'package:ecole_prof/screen/widgets/circularprogess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpdatePswd extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final update = Get.put(UpdatePassWordController());

  ;


    return Scaffold(
      
        body:             GetBuilder<UpdatePassWordController>(
                          builder: (_) => Container(
                         
                              child: update.answer?Center(child: CircularProgress()):UpdatePswdContent() ,

                              )),

         

    );
  }
}