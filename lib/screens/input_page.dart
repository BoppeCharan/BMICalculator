import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/gender_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


enum Gender {
  male,
  female
}
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ?  activeCardColor : inactiveCardColor,
                    cardChild: const GenderWidget(
                      genderIcon: FontAwesomeIcons.mars,
                      gender: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                    cardChild: const GenderWidget(
                      genderIcon: FontAwesomeIcons.venus,
                      gender: "FEMALE",
                    ),
                  ),
                )
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style:  labelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString() , style: numberTextStyle,
                      ),
                      Text("cm", style: labelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:const RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor:const Color(0xFFEB1555),
                      overlayColor:const Color(0x15EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                        
                      },
                      value: height.toDouble(),),
                  )
                ],
              ), onPress: () {},
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("WEIGHT" , style: labelTextStyle,),
                      Text(weight.toString(), style: numberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        RoundIconButton(iconData: FontAwesomeIcons.minus, onPress: () {
                          setState(() {
                            weight--;
                          });
                        },),
                        const SizedBox(width: 10,),
                        RoundIconButton(iconData: FontAwesomeIcons.plus, onPress: () {
                          setState(() {
                            weight++;
                          });
                        },),
                      ],)
                    ],
                  ), onPress: () {},
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("AGE" , style: labelTextStyle,),
                      Text(age.toString(), style: numberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        RoundIconButton(iconData: FontAwesomeIcons.minus, onPress: () {
                          setState(() {
                            age--;
                          });
                        },),
                        const SizedBox(width: 10,),
                        RoundIconButton(iconData: FontAwesomeIcons.plus, onPress: () {
                          setState(() {
                            age++;
                          });
                        },),
                      ],)
                    ],
                  ), onPress: () {},
                ))
              ],
            )),
            BottomButton(title: "CALCULATE", onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                  CalculatorBrain results = new CalculatorBrain(height: height, weight: weight);
                  return ResultPage(
                    bmiResult:  results.CalculateBMI(),
                    resultText: results.getResult(),
                    interpretation:  results.getInterpretation(),
                  );
                } ) );
            })
          ],
        ));
  }
}
