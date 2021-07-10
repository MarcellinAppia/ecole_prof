import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Color(0xFFf2142b), 
      ),
    );
  }
}