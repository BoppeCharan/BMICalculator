
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    required this.genderIcon, required this.gender
  });

  final IconData genderIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0
        ),
        SizedBox(height: 15,),
        Text( gender, style: labelTextStyle,)
      ],
    );
  }
}
