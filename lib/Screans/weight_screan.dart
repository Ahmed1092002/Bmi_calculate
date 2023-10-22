import 'dart:math';

import 'package:bmi/Componant/converter_switcher.dart';
import 'package:bmi/Componant/gauges_componant.dart';
import 'package:bmi/Screans/Welcome_Screan.dart';
import 'package:bmi/Screans/hight__screan.dart';
import 'package:bmi/blocs/BmiCalculate/bmi_claculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/Nafigator.dart';

class WeightScrean extends StatefulWidget {
  String? text;

  WeightScrean({this.text, this.image});

  String? image;


  @override
  State<WeightScrean> createState() => _WeightScreanState();
}

class _WeightScreanState extends State<WeightScrean> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiClaculateCubit, BmiClaculateState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BmiClaculateCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Select Your Height', style: TextStyle(fontSize: 30.sp)),
ConverterSwitcher(
  listTextTabToggle: cubit.listTextTabToggleWight,
  tabIndexBasicToggle: cubit.tabIndexBasicToggleWight,
  convertFunction: cubit.convertWight,
),
              RadialGaugeExample(),
              ElevatedButton(
                  onPressed: () => navigateToScreen(context, HightScrean(
                    image: widget.image,
                    text: widget.text,
                  )),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 10),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black),
                      Text('Back', style: TextStyle(color: Colors.black)),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    cubit.bmiCalculatefunction(context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 10),
                      backgroundColor: Color(0xFF7AAFDF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text('CALCULATE BMI')),

            ],
          ),
        );
      },
    );
  }
}
