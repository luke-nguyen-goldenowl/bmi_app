import 'dart:math';

import 'package:bmi/gender/gender.dart';
import 'package:bmi/utils/card_title.dart';
import 'package:bmi/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderCard extends StatelessWidget {
  final Gender initialGender;
  final ValueChanged<Gender> onChanged;

  const GenderCard({Key key, this.initialGender, this.onChanged})
      : super(key: key);

//   @override
//   _GenderCardState createState() => _GenderCardState();
// }

// class _GenderCardState extends State<GenderCard> {
//   AnimationController _arrowAnimationController;
//   Gender selectedGender;

//   @override
//   void initState() {
//     selectedGender = widget.initialGender; //<--- initialize selected gender
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardTitle("GENDER"),
              Padding(
                padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
                child: _drawMainStack(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawMainStack() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _drawCircleIndicator(),
        GenderIconTranslated(gender: Gender.male),
        GenderIconTranslated(gender: Gender.female),
        _drawGestureDetector(),
      ],
    );
  }

  Widget _drawCircleIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GenderCircle(),
        GenderArrow(angle: _genderAngles[initialGender] ?? 0),
      ],
    );
  }

  _drawGestureDetector() {
    return Positioned.fill(
      child: TapHandler(
        onGenderTapped: (gender) => onChanged(gender),
      ),
    );
  }
}

class GenderCircle extends StatelessWidget {
  double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _circleSize(context),
      height: _circleSize(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(244, 244, 244, 1.0),
      ),
    );
  }
}

class GenderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenAwareSize(6.0, context),
        top: screenAwareSize(8.0, context),
      ),
      child: Container(
        height: screenAwareSize(8.0, context),
        width: 1.0,
        color: Color.fromRGBO(216, 217, 223, 0.54),
      ),
    );
  }
}

const Map<Gender, double> _genderAngles = {
  Gender.female: -pi / 4,
  Gender.male: pi / 4,
};

class GenderIconTranslated extends StatelessWidget {
  static final Map<Gender, String> _genderImages = {
    Gender.female: "images/gender_female.svg",
    Gender.male: "images/gender_male.svg",
  };

  final Gender gender;

  const GenderIconTranslated({Key key, this.gender}) : super(key: key);

  String get _assetName => _genderImages[gender ?? Gender.female] ?? "";

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.all(0),
      child: SvgPicture.asset(
        _assetName ?? '',
        height: screenAwareSize(16.0, context),
        width: screenAwareSize(16.0, context),
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -(_genderAngles[gender] ?? 0),
      child: icon,
    );
    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rotatedIcon,
          GenderLine(),
        ],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: _genderAngles[gender] ?? 0,
      child: iconWithALine,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }
}

class GenderArrow extends StatelessWidget {
  final double angle;

  const GenderArrow({Key key, this.angle}) : super(key: key);

  double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);

  double _translationOffset(BuildContext context) =>
      _arrowLength(context) * -0.4;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0.0, _translationOffset(context)),
        child: Transform.rotate(
          angle: -pi / 4,
          child: SvgPicture.asset(
            "images/gender_arrow.svg",
            height: _arrowLength(context),
            width: _arrowLength(context),
          ),
        ),
      ),
    );
  }
}

class TapHandler extends StatelessWidget {
  final Function(Gender) onGenderTapped;

  const TapHandler({Key key, this.onGenderTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.female))),
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.male))),
      ],
    );
  }
}
