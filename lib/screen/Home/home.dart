import 'package:ecole_prof/screen/login/loginControlleur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'home_content.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     
  final us = GetStorage();
  // var user =us.read('user');
  // print('l\'utilisateur connecte est $user');
  
    return  Scaffold(
     

       body:  GetBuilder<LoginController>(
                builder: (_) => Container(
                      child: HomeContent(),
                     
                    ),)    
       

    );
  }
}