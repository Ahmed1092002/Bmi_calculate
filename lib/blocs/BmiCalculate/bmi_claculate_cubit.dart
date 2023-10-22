
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi/Screans/Welcome_Screan.dart';
import 'package:bmi/generated/assets.dart';
import 'package:bmi/utils/Nafigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


import 'dart:math' as math;

part 'bmi_claculate_state.dart';

class BmiClaculateCubit extends Cubit<BmiClaculateState> {
  BmiClaculateCubit() : super(BmiClaculateInitial());

  static BmiClaculateCubit get(context) => BlocProvider.of(context);

  double hightValue = 140.0;
  String? bmiResult;

  double? weightValue = 50.0;
  double? valueOfBmi = 0;
  double? minOfSlider = 135.0;
  double? maxOfSlider = 185.0;
  double? minOfRadialGauge = 40;
  double? maxOfRadialGauge = 75;
  double? interval = 5.0;
  double? intervalGauge = 5.0;
  final GlobalKey<SfRadialGaugeState> gaugeKey =
  GlobalKey<SfRadialGaugeState>();

  final ValueNotifier<int> tabIndexBasicToggleHight = ValueNotifier(0);
  final ValueNotifier<int> tabIndexBasicToggleWight = ValueNotifier(0);

  List<String> get listTextTabToggleHight =>
      ["cm", "Meter"];

  List<String> get listTextTabToggleWight =>
      ["KGS", "LBS"];

  changeTabHight(int index) {
    tabIndexBasicToggleHight.value = index;

    emit(ChangeTabHightfunctionState());
  }

  changeTabWight(int index) {
    tabIndexBasicToggleWight.value = index;

    emit(ChangeTabWightfunctionState());
  }

  void convertHight() {
    if (tabIndexBasicToggleHight.value == 0) {
      hightValue = 140.0;
      minOfSlider = 135.0;
      maxOfSlider = 185.0;
      interval = 5.0;

      emit(ToCmfunctionState());
    }
    else if (tabIndexBasicToggleHight.value == 1) {
      hightValue = 1.40;
      minOfSlider = 1.35;
      maxOfSlider = 1.85;
      interval = 0.099999/2.roundToDouble();
      emit(ToMeterfunctionState());
    }
    else if (tabIndexBasicToggleHight.value == 2) {
      hightValue = 4.593175853;
      minOfSlider = 4.429;
      maxOfSlider = 6.069;
      interval = 0.2733;
      emit(ToFeetfunctionState());
    }
  }

  updatePan(var value) {
    weightValue = value;
    print(value);


    emit(UpdatePanfunctionState());
  }


  void convertWight() {
    if (tabIndexBasicToggleWight.value == 0) {
      weightValue = 50.0;
      minOfRadialGauge = 40;
      maxOfRadialGauge = 75;
      intervalGauge = 5;
      emit(ToKGSfunctionState());
    } else if (tabIndexBasicToggleWight.value == 1) {
      weightValue = 110.231131;
      minOfRadialGauge = 88.184905;
      maxOfRadialGauge = 165.346;
      intervalGauge = 15;
      emit(ToLBSfunctionState());
    }
  }

  void updateHight(double value) {
    hightValue = value;

    emit(UpdateHightState());
    print(hightValue);
  }

  bmiCalculatefunction(BuildContext context) {
    print(weightValue);
    print(hightValue);

    // valueOfBmi = weightValue! / (pow(hightValue, 2));
    // cm
if (tabIndexBasicToggleHight.value == 0 ){
  //cm and kgs
  if(tabIndexBasicToggleWight.value == 0){
    valueOfBmi = (weightValue! / (pow(hightValue, 2))) * 10000;
  }
  /*
  cm to inch
  inch an lbs
  */
  else if(tabIndexBasicToggleWight.value == 1){
    valueOfBmi = weightValue! / (pow(hightValue/2.54, 2)) * 703;
  }
}
//meter


if(tabIndexBasicToggleHight.value ==1){
  //meter and kgs
  if(tabIndexBasicToggleWight.value == 0){
    valueOfBmi = weightValue! / (pow(hightValue, 2));
  }
    /**
     meter to inch
        meter an  lbs
     */

  else if(tabIndexBasicToggleWight.value == 1){
    valueOfBmi = weightValue! / (pow(hightValue *39.3700787402, 2)) * 703;
  }

}

    if (valueOfBmi! < 18.5) {
      bmiResult = "Underweight";
      // Add your code here to handle underweight statistics
    }
    else if (valueOfBmi! >= 18.5 && valueOfBmi! < 25) {
      bmiResult = "Normal weight";
      // Add your code here to handle normal weight statistics
    }
    else if (valueOfBmi! >= 25 && valueOfBmi! < 30) {
      bmiResult = "Overweight";
      // Add your code here to handle overweight statistics
    }
    else {
      bmiResult = "Obese";
      // Add your code here to handle obese statistics
    }


    emit(BmiCalculatefunctionState());
    print(valueOfBmi);
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
title: "Your BMI is ${valueOfBmi!}",

      text: "You are $bmiResult",
      customAsset: Assets.assestsSuccess,

      animType: QuickAlertAnimType.slideInUp,
      showConfirmBtn: true,
      confirmBtnColor: Color(0xFF7AAFDF),
      onConfirmBtnTap: () {
       navigateToScreen(context, WelcomeScrean());
      },
      confirmBtnText: "Try Again",



    );
  }


//
//   showScoreDialog() {
//     bool isPassed = false;
//
//
//
//     return AlertDialog(
//         title: Text(
//         title + " | Score is $score",
//         style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
//     ),
//     content: ElevatedButton(
//     child: const Text("Restart"),
//     onPressed: () {
//     Navigator.pop(context);
//     setState(() {
//     currentQuestionIndex = 0;
//     score = 0;
//     selectedAnswer = null;
//     });
//     },
//     ),
// }
}