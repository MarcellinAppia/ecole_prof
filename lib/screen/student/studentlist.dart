import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vos éleves'),centerTitle: true,),
      body:         Column(

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
                       // Get.to();
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
                                        backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/3011/3011270.png'),),
                                    ),
                                  ),
                                  //Text(child[index].prenom),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 30,),
                                        FittedBox(child: Text('Cheick Tidiane',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
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