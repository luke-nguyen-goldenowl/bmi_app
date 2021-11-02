import 'package:bmi/app_bar.dart';
import 'package:bmi/gender/gender.dart';
import 'package:bmi/gender/gender_card.dart';
import 'package:bmi/height/height_card.dart';
import 'package:bmi/input_summary_card.dart';
import 'package:bmi/pacman/pacman_slider.dart';
import 'package:bmi/result_screen.dart';
import 'package:bmi/utils/widget_utils.dart';
import 'package:bmi/weight/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with TickerProviderStateMixin {
  AnimationController _submitAnimationController;
  Gender gender = Gender.male;
  int height = 170;
  int weight = 70;

  @override
  void initState() {
    _submitAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    // _submitAnimationController.addStatusListener((status) {
    //   //add a listener
    //   if (status == AnimationStatus.completed) {
    //     _goToResultPage().then((_) => _submitAnimationController
    //         .reset()); //reset controller when coming back
    //   }
    // });
    super.initState();
  }

  // _goToResultPage() async {
  //   return Navigator.of(context).push(FadeRoute(
  //     //use the FadeRoute
  //     builder: (context) => ResultScreen(
  //       weight: weight,
  //       height: height,
  //       gender: gender,
  //     ),
  //   ));
  // }

  @override
  void dispose() {
    _submitAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: BmiAppBar(),
          preferredSize: Size.fromHeight(appBarHeight(context)),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InputSummaryCard(
                gender: gender,
                weight: weight,
                height: height,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: GenderCard(
                                initialGender: gender,
                                onChanged: (val) =>
                                    setState(() => gender = val),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: WeightCard(
                                initialWeight: weight,
                                onChanged: (val) =>
                                    setState(() => weight = val),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: HeightCard(
                          height: height,
                          onChanged: (val) => setState(() => height = val),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _buildBottom(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: PacmanSlider(
        submitAnimationController: _submitAnimationController,
        onSubmit: () {
          onPacmanSubmit;
          Get.to(ResultScreen(
            height: height,
            weight: weight,
            gender: gender,
          ));
        },
      ),
    );
  }

  void onPacmanSubmit() {
    _submitAnimationController.forward();
  }

  // Widget _buildCards(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       left: 14.0,
  //       right: 14.0,
  //       top: screenAwareSize(32.0, context),
  //     ),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: Column(
  //             children: <Widget>[
  //               Expanded(child: _tempCard("Gender")),
  //               Expanded(child: _tempCard("Weight")),
  //             ],
  //           ),
  //         ),
  //         Expanded(child: _tempCard("Height"))
  //       ],
  //     ),
  //   );
  // }

  // Widget _tempCard(String label) {
  //   return Card(
  //     child: Container(
  //       width: double.infinity,
  //       height: double.infinity,
  //       child: Text(label),
  //     ),
  //   );
  // }
}
