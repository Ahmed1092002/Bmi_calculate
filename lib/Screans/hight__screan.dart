
import 'package:bmi/Componant/converter_switcher.dart';
import 'package:bmi/Componant/hight_componant.dart';

import 'package:bmi/Screans/Welcome_Screan.dart';
import 'package:bmi/Screans/weight_screan.dart';
import 'package:bmi/blocs/BmiCalculate/bmi_claculate_cubit.dart';
import 'package:bmi/utils/Nafigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HightScrean extends StatefulWidget {
  String? text;
  String? image;


  HightScrean({this.text, this.image});

  @override
  State<HightScrean> createState() => _HightScreanState();
}

class _HightScreanState extends State<HightScrean> {
  var size, height, width;



  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return BlocConsumer<BmiClaculateCubit,BmiClaculateState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    var cubit= BmiClaculateCubit.get(context);
    return Scaffold(
      body: Column(
        children: [
          Text('Select Your Height', style: TextStyle(fontSize: 20.sp)),
          Text(widget.text!, style: TextStyle(fontSize: 20.sp,)),
          ConverterSwitcher(
            tabIndexBasicToggle: cubit.tabIndexBasicToggleHight,
            convertFunction: cubit.convertHight,
            listTextTabToggle: cubit.listTextTabToggleHight,

          ),
          HightComponant(image: widget.image,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: ()  {


                    navigateToScreen(context, WelcomeScrean());

                    },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 0),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black),
                      Text('BACK', style: TextStyle(color: Colors.black)),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () => navigateToScreen(
                      context,
                      WeightScrean(
                        text: widget.text,
                        image: widget.image,
                      )),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 0),
                      backgroundColor: const Color(0xFF7AAFDF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Row(
                    children: [
                      Text('NEXT'),
                      Icon(Icons.arrow_forward),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  },
);
  }
}
