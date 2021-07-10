import 'package:ecole_prof/screen/updatepsw/updatepswd_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class UpdatePswdContent extends StatelessWidget {

   TextEditingController psw = TextEditingController();
   TextEditingController psw2 = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
 final update = Get.find<UpdatePassWordController>();
     final user = GetStorage();
     String? userpsw = user.read('email');


    return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
                child: Container(
                  width: 90,
                  height: 90,
                  
                  child: Text("""Vous vous connectez pour la première fois, changez votre mot de passe """, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
                child: Container(
                  width: 200,
                  height: 50,
                  //email
                 
                    child: TextField(
                       obscuringCharacter: '*',
                      obscureText: true,
                      controller:  psw,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.password_rounded), labelText: "mot de passe", hintText: "votre mot de passe",fillColor: Colors.white, filled:true, 
                               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),

              //password
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Container(
                    width: 200,
                    height: 50,
                  
                  child: TextField(
                    obscuringCharacter: '*',
                    obscureText: true,
                    controller: psw2,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.password_rounded), labelText: "mot de passe", hintText: "confirmer votre mot de passe",fillColor: Colors.white, filled:true, 
                               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ),

              //button CONNEXION
                Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                 child: Container(
                  

                   width: 200,
                   height: 50,

                      child: TextButton(onPressed: ()  { 

        
                          if(psw.text!='' && psw2.text!=''){
                            if(psw.text == psw2.text){
                                 update.updatePassword(psw.text);
                            }else{
                                      Get.snackbar('', 'les mots de passe ne sont pas identiques',
                                      colorText: Color(0xFFffffff),
                                      backgroundColor: Color(0xFFf2142b),
                                      duration: Duration(seconds: 4),
                                      snackPosition: SnackPosition.BOTTOM,
                                      snackStyle: SnackStyle.GROUNDED);
                            }
                          }else{
                                    Get.snackbar('', 'vous devez remplir tout les champs,',
                                  colorText: Color(0xFFffffff),
                                  backgroundColor: Color(0xFFf2142b),
                                  duration: Duration(seconds: 4),
                                  snackPosition: SnackPosition.BOTTOM,
                                  snackStyle: SnackStyle.GROUNDED);
                            

                          }
                          
                       
                        } ,
                          child:

                          
                            Text('CONTINUER', textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 20, 
                                                  fontWeight: FontWeight.bold, color: Colors.white),),
                      ) , 
                                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(40))),

                 ),
                ),  

             ],
          ),
        );
  }
}