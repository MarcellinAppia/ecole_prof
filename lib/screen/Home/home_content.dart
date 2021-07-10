import 'package:ecole_prof/screen/student/studentlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
   

//var daddy = enfants.read('user');



    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Vos Classes'),
        ),
        body: 
        // GridView.count(
        //     primary: false,
        //     padding: const EdgeInsets.all(20),
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     crossAxisCount: 3,
        //     //childAspectRatio: 1,

        //     children: List.generate(child.length, (index) {
        //       return Column(
        //         children: [
        //           GestureDetector(
        //             onTap: () {
        //               Get.to(StudentPage(child[index]));
        //             },
        //             child: Expanded(
        //               child: Container(
        //                   width: 100,
        //                   height: 100,
        //                   child: CircleAvatar(
        //                     backgroundImage: NetworkImage(
        //                         'https://image.flaticon.com/icons/png/512/145/145867.png'),
        //                   )),
        //             ),
        //           ),
        //           Expanded(
        //             child: Text(child[index].prenom),
        //           ),
        //         ],
        //       );
        //     }),
        //   ),

        Column(

            children: [
              SizedBox(height:65),
              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8),
               
                  child: Container(
                 
                   height: 450,
                    child: ListView.builder(
                      itemCount: 3,
                      
                      itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 150,
                      child: GestureDetector( onTap :(){
                        Get.to(StudentList());
                      }, 
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(  
                            //color: Color(0xFFd2c1a9),
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),         
                            child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:8,left:8,bottom: 8,right: 20),
                                      child: CircleAvatar(
                                        maxRadius:50,
                                        backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/2883/2883815.png'),),
                                    ),
                                  ),
                                  //Text(child[index].prenom),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 30,),
                                        FittedBox(child: Text('6 eme A',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                                       // FittedBox(child: Text(,style: TextStyle(fontWeight: FontWeight.normal),textAlign: TextAlign.left,)),
                                      ],
                                    ),
                                  )
                                ],
                             ),
                         ),
                        ), )
                      );
                    }
                    ),
                  ),
                
              ),
            ],
        )
        );
  }
}
