import 'package:ecole_prof/screen/login/loginControlleur.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginContent extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

//  AuthentParent auth;
//  Parent parent;

  final user = GetStorage();

  //  LoginController log;
  //  LoginContent({this.log});

  @override
  Widget build(BuildContext context) {
    final log = Get.find<LoginController>();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Container(
              width: 90,
              height: 90,
              child: Image.asset('assets/images/logoMs.png'),
            ),
          ),
          Center(child: Container(child: Text('App Professeur',style: TextStyle(fontWeight: FontWeight.bold),),)),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
            child: Container(
              width: 200,
              height: 50,
              //email

              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "email",
                    hintText: "votre addresse email",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
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
                controller: password,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded),
                    labelText: "password",
                    hintText: "votre mot de passe",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
          ),

          //button CONNEXION
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Container(
              width: 200,
              height: 50,
              child: TextButton(
                onPressed: () async {
                  if (email.text != '' && password.text != '') {
                    await log.login(email.text, password.text);
                    user.write('isLogged', true);
                    user.write('email', email.text);
                    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    // sharedPreferences.setString('email', email.text);
                  }
                },
                child: Text(
                  'CONNEXION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          //   child: Container(
          //       child: Text(
          //     'mot de passe oublié ?',
          //     textAlign: TextAlign.right,
          //   )),
          // ),
        ],
      ),
    );
  }
}
