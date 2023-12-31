import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.iconData, required this.onPress});

  final IconData iconData;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPress,
        elevation: 6.0,
        constraints: const BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,
        ),
        shape:const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        child: Icon(iconData),
      );
  }
}