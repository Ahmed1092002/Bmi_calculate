import 'package:bmi/Screans/weight_screan.dart';
import 'package:bmi/blocs/BmiCalculate/bmi_claculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'dart:math' as math;

class RadialGaugeExample extends StatefulWidget {
  RadialGaugeExample();

  @override
  _RadialGaugeExampleState createState() => _RadialGaugeExampleState();
}

class _RadialGaugeExampleState extends State<RadialGaugeExample> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiClaculateCubit, BmiClaculateState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BmiClaculateCubit.get(context);
        return Center(
            child: Column(
              children: [
                RadialGauge(
radiusFactor:0.9 ,
          needlePointer: [
                NeedlePointer(
                  isInteractive: true,
                  value: cubit.weightValue!,
                  needleStyle: NeedleStyle.gaugeNeedle,
                  needleWidth: 20,
                  tailRadius: 40,
                  color: Color(0xFF79AFDF),
                  tailColor: Color(0xFF79AFDF),
                  needleHeight: 100,
                  onChanged: (value) {
                   cubit.updatePan(value);
                    print(value);
                  },
                ),
          ],
          track: RadialTrack(


                start: cubit.minOfRadialGauge!.roundToDouble(),
                end: cubit.maxOfRadialGauge!.roundToDouble(),
                startAngle: 0,
                endAngle: 180,
                steps: cubit.intervalGauge!.toInt(),
hideTrack: true,

                trackStyle: TrackStyle(

                  showLastLabel: true,
                  showLabel: true,
primaryRulerColor: Color(0xFF79AFDF),
                  primaryRulersHeight: 15,


                  secondaryRulerColor: Colors.grey,
                  secondaryRulerPerInterval: 5,
                ),
          ),
        ),
                Text(
                  '${cubit.weightValue!.round()} KG',
                  style: TextStyle(fontSize: 20.sp, color: Color(
                      0xFF7AAFDF))),
              ],
            )

            );
      },
    );
  }
}
// GestureDetector(
//   onPanUpdate: (DragUpdateDetails details) {
//     cubit.updatePan(details, context);
//   },
//
//   child: ,
//   // SfRadialGauge(
//   //   key:cubit.gaugeKey,
//   //   axes: <RadialAxis>[
//   //     RadialAxis(
//   //       axisLineStyle: null,
//   //       interval:20,
//   //       ticksPosition: ElementsPosition.outside,
//   //       showLastLabel: true,
//   //       minorTicksPerInterval: 4,
//   //       labelsPosition: ElementsPosition.outside,
//   //       maximumLabels: cubit.maxOfRadialGauge!.toInt(),
//   //       showTicks: true,
//   //       showLabels: true,
//   //       showFirstLabel: true,
//   //       showAxisLine: true,
//   //       canRotateLabels: true,
//   //       axisLabelStyle: null,
//   //       majorTickStyle: null,
//   //       minorTickStyle: null,
//   //       startAngle: 180,
//   //       endAngle: 0,
//   //       radiusFactor: 0.7,
//   //       maximum: cubit.maxOfRadialGauge!,
//   //       minimum: cubit.minOfRadialGauge!,
//   //       pointers: <GaugePointer>[
//   //         RangePointer(
//   //           value: cubit.weightValue!,
//   //           width: 0.5.w,
//   //           color: Colors.blue,
//   //           enableAnimation: true,
//   //           animationDuration: 1000,
//   //
//   //         ),
//   //         NeedlePointer(
//   //           value: cubit.weightValue!,
//   //           lengthUnit: GaugeSizeUnit.factor,
//   //           knobStyle: KnobStyle(color: Color(0xFF79AFDF)),
//   //           needleColor: Color(0xFF79AFDF),
//   //           enableAnimation: true,
//   //           animationDuration: 1000,
//   //         ),
//   //       ],
//   //       annotations: <GaugeAnnotation>[
//   //         GaugeAnnotation(
//   //           widget: Text(
//   //             '${cubit.weightValue!.round()} KG',
//   //             style: TextStyle(fontSize: 20.sp, color: Color(
//   //                 0xFF7AAFDF)),
//   //           ),
//   //           angle: 90,
//   //           positionFactor: 0.5,
//   //         ),
//   //       ],
//   //     ),
//   //   ],
//   // ),
// ),