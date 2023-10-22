import 'package:bmi/Componant/Gender_Button.dart';
import 'package:bmi/blocs/BmiCalculate/bmi_claculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generated/assets.dart';

class WelcomeScrean extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiClaculateCubit, BmiClaculateState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var  cubit =BmiClaculateCubit.get(context);
        return Scaffold(

          body: Center(
            child: Column(

              children: [
                SizedBox(
                  height: 100,
                ),
                Text("Select Your Gender", style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),),

                GenderButton(
                  text: 'male',
                  image: Assets.assestsClipartKey2370453,
                ),
                SizedBox(
                  height: 50,
                ),
                GenderButton(
                  text: 'female',
                  image: Assets.assests_Pngtree_cartoon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}