// import 'dart:math';

// import 'package:bmi/utils/widget_utils.dart';
// import 'package:flutter/material.dart';

// class TransitionDot extends AnimatedWidget {
//   TransitionDot({Key key, Listenable animation})
//       : super(key: key, listenable: animation);

//   Animation<int> get positionAnimation => IntTween(
//         begin: 0,
//         end: 50,
//       ).animate(
//         CurvedAnimation(
//           parent: super.listenable,
//           curve: Interval(0.15, 0.3),
//         ),
//       );
//   Animation<double> get sizeAnimation => LoopedSizeAnimation().animate(
//         CurvedAnimation(
//           parent: super.listenable,
//           curve: Interval(0.3, 0.8),
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     double scaledSize =
//         screenAwareSize(sizeAnimation.value, context); //get size from animation
//     double deviceHeight =
//         MediaQuery.of(context).size.height; //get device height
//     double deviceWidth = MediaQuery.of(context).size.width; //get device width
//     double height = min(scaledSize,
//         deviceHeight); //make sure the height isn't bigger than the screen
//     double width = min(scaledSize, deviceWidth); //same for width
//     Decoration decoration = BoxDecoration(
//       shape: width < 0.9 * deviceWidth
//           ? BoxShape.circle
//           : BoxShape.rectangle, //update shape
//       color: Theme.of(context).primaryColor,
//     );

//     Widget dot = Container(
//       decoration: decoration,
//       width: width,
//       height: height,
//     );
//     return IgnorePointer(
//       child: Opacity(
//         opacity: positionAnimation.value > 0
//             ? 1.0
//             : 0.0, //check for positionAnimation
//         child: Scaffold(
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 Spacer(flex: 104 - positionAnimation.value), //upper spacer
//                 dot,
//                 Spacer(flex: 4 + positionAnimation.value), //lower spacer
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoopedSizeAnimation extends Animatable<double> {
//   final double defaultSize = 52.0;
//   final double expansionRange = 30.0;
//   final int numberOfCycles = 2;
//   final double fullExpansionEdge = 0.8;

//   @override
//   double transform(double t) {
//     if (t < fullExpansionEdge) {
//       double normalizedT = t / fullExpansionEdge;
//       return defaultSize +
//           sin(numberOfCycles * 2 * pi * normalizedT) * expansionRange;
//     } else {
//       double normalizedT = (t - fullExpansionEdge) / (1 - fullExpansionEdge);
//       return defaultSize + normalizedT * 2000.0;
//     }
//   }
// }
