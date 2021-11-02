import 'package:bmi/calculator_screen.dart';
import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gender/gender.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
    systemNavigationBarColor: Colors.white, //bottom bar color
    systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //title: 'BMI Calculator',
      home: CalculatorScreen(),
    );
  }
}
