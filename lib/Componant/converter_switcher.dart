import 'package:bmi/blocs/BmiCalculate/bmi_claculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ConverterSwitcher extends StatefulWidget {
  final void Function() ? convertFunction;
  final List<String>? listTextTabToggle;
  final ValueNotifier<int>? tabIndexBasicToggle;
  const ConverterSwitcher({Key? key,this.convertFunction,this.listTextTabToggle,this.tabIndexBasicToggle}) : super(key: key);

  @override
  _ConverterSwitcherState createState() => _ConverterSwitcherState();
}

class _ConverterSwitcherState extends State<ConverterSwitcher> {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<BmiClaculateCubit, BmiClaculateState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=BmiClaculateCubit.get(context);
        return ValueListenableBuilder(
            valueListenable: widget.tabIndexBasicToggle!,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(

                width: 90,

                borderRadius: 30,
                height: 50,
                selectedIndex: currentIndex,

                selectedBackgroundColors: [Color(0xFF7AAFDF)],
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                unSelectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                labels:widget.listTextTabToggle!,
                selectedLabelIndex: (index) {
                  if (widget.listTextTabToggle![index] ==cubit.listTextTabToggleHight[index]){
                    cubit.changeTabHight(index);
                  }else if (widget.listTextTabToggle![index]==cubit.listTextTabToggleWight[index]){

                    cubit.changeTabWight(index);
                  }



                  widget.convertFunction!();

                },
                isScroll: true,

              );
            });
      },
    ); // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
  }
}
