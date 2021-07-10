//import 'dart:html';

import 'dart:convert';

import 'package:ecole_prof/screen/login/loginControlleur.dart';
import 'package:ecole_prof/screen/login/logincontent.dart';
import 'package:ecole_prof/screen/widgets/circularprogess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(LoginController());
    //final tasking = Obx(() => ('${log.tasking}'));

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('MonSuiviScolaire'),
      // ),
      body:
          // GetBuilder<loginC>(
          // loginC.tasking?LoginContent(): CircularProgress()),

          //   GetBuilder<LoginController>(
          // init: LoginController(),
          // builder: (loginC) {
          //   return loginC.tasking
          //     ? (Obx(() => LoginContent()) : CircularProgressIndicator();
          // }
          //   Obx(
          // () => Container(child: getContent(loginC)),
          GetBuilder<LoginController>(
        builder: (_) => Container(
          child: loginC.tasking
              ? Center(
                  child: CircularProgress(),
                ): LoginContent(),
        ),
      ),
    );
  }
}
  // Widget getContent(String tasking) {
  //   if (tasking == 'true') {
  //     return Center(child: CircularProgress());
  //   } else {
  //     return LoginContent();
  //   }
  