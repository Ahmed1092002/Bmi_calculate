import 'package:bmi/blocs/BmiCalculate/bmi_claculate_cubit.dart';
import 'package:bmi/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

class HightComponant extends StatefulWidget {
  String? image;
HightComponant({Key? key,this.image}) : super(key: key);

  @override
  _HightComponantState createState() => _HightComponantState();
}

class _HightComponantState extends State<HightComponant> {

  // double _sliderValue = 140;
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    height = size.height;
    width = size.width;
    return BlocConsumer<BmiClaculateCubit, BmiClaculateState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BmiClaculateCubit.get(context);
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (cubit.tabIndexBasicToggleHight.value == 1 )
              SizedBox(
                height: height / 1.3,
                child: Image.asset(widget.image!,
                  height:cubit.hightValue*100 ,
                  width: cubit.hightValue*100 ,
                ),
              ),
              if ( cubit.tabIndexBasicToggleHight.value == 2)
              SizedBox(
                height: height / 1.3,
                child: Image.asset(widget.image!,
                  height:cubit.hightValue*30 ,
                  width: cubit.hightValue*30 ,
                ),
              ),
               if (cubit.tabIndexBasicToggleHight.value == 0)
               SizedBox(
                  height: height / 1.3,
                  child: Image.asset(widget.image!,
                    height:cubit.hightValue ,
                    width: cubit.hightValue ,
                  ),
                ),
              SizedBox(
                 height: height / 1.5,
                child:LinearGauge(
                  end: cubit.maxOfSlider,
                  start: cubit.minOfSlider,
                  steps:  cubit.interval,

                  valueBar: [
                    ValueBar(

                        value: cubit.hightValue,
                      color: Color(0xFF7AAFDF),
borderRadius: 30,
                      valueBarThickness: 10,
                   )
                  ],
                  pointers: [
                   Pointer(
                       value: cubit.hightValue,
                       shape: PointerShape.triangle,
                       color: Color(0xFF7AAFDF),
                     isInteractive: true,

                     width: 20,
                     height: 50,
                     showLabel: true,

                      labelStyle: TextStyle(

                        fontSize: 20,
                        backgroundColor: Colors.black,

                      ),
                     enableAnimation: true,
                     pointerPosition: PointerPosition.center,

                     onChanged: (value) {
                       cubit.updateHight(value);
                     },
                   )
                  ],
gaugeOrientation: GaugeOrientation.vertical,
                  rulers:  RulerStyle(
                    rulerPosition: RulerPosition.left,
showLabel: true,
                    primaryRulerColor: Color(0xFF79AFDF),
                    primaryRulersHeight: 15,


                    secondaryRulerColor: Colors.grey,
                    secondaryRulerPerInterval: 5,


                  ),

                )



              ),

            ],
          ),
        );
      },
    );
  }
}
