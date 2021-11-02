import 'package:bmi/calculator_screen.dart';
import 'package:bmi/gender/gender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final int height;
  final int weight;
  final Gender gender;
  const ResultScreen(
      {this.height = 0, this.weight = 0, this.gender = Gender.female, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            'YOUR BMI',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        child: Image.network(
                            'https://st2.depositphotos.com/3096625/8170/v/600/depositphotos_81700460-stock-illustration-monogram-l-logo-letter.jpg'),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        calculator().toString(),
                        style: TextStyle(
                          fontSize: 200,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              gender == Gender.male
                                  ? 'Nam'
                                  : gender == Gender.female
                                      ? 'Nữ'
                                      : '?',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              height.toString() + 'm',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              weight.toString() + 'kg',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.lightBlueAccent,
                      ),
                      //color: Colors.lightBlueAccent,
                      width: 67,
                      height: 67,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Get.to(CalculatorScreen()),
                                icon: Icon(
                                  Icons.replay_circle_filled_sharp,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculator() {
    if (gender == Gender.male) {
      return height * 2 + weight * 3 + 100.0;
    } else if (gender == Gender.female) {
      return height * 3 + weight * 2 + 50.0;
    } else
      return 0;
  }
}
