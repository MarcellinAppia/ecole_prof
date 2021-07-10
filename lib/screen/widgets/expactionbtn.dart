import 'package:flutter/material.dart';
import 'dart:math' as math;

@immutable
class ExpandingActionButton extends StatelessWidget {
 ExpandingActionButton({
   Key key,
    this.directionInDegrees,
    this.maxDistance,
    this.progress,
    this.child,
 }) : super(key: key);

 final double directionInDegrees;
 final double maxDistance;
 final Animation<double> progress;
 final Widget child;

 @override
 Widget build(BuildContext context) {
   return AnimatedBuilder(
     animation: progress,
     builder: (BuildContext context, Widget child) {
       final offset = Offset.fromDirection(
         directionInDegrees * (math.pi / 180.0),
         progress.value * maxDistance,
       );
       return Positioned(
         right: 4.0 + offset.dx,
         bottom: 4.0 + offset.dy,
         child: Transform.rotate(
           angle: (1.0 - progress.value) * math.pi / 2,
           child: child,
         ),
       );
     },
     child: FadeTransition(
       opacity: progress,
       child: child,
     ),
   );
 }
}
