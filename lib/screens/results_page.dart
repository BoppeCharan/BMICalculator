import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("BMI Calculator"), backgroundColor: const Color(0xFF0A0E21),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0.0),
            alignment: Alignment.bottomLeft,
            child: const Text("Your Result", style: titleTextStyle),
          ),),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPress: () {},
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText, style: resultTextStyle),
                  Text(bmiResult, style: bmiTextStyle),
                  Container( margin: EdgeInsets.all(12.0) ,child: Text(interpretation, textAlign: TextAlign.center ,style: bodyTextStyle,))
                ],
              ) ,
            )),
          BottomButton(title: "RE-CALCULATE", onPress: () {
            Navigator.pop(context);
          },)
      ],)
    );
  }


}

