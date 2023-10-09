import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    required this.title, required this.onPress
  });

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          height: bottomContainerHeight,
          color: const Color(0xFFEB1555),
          margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child:  Center(child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),)),
        ),
      );
  }
}