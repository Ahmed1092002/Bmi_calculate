import 'package:bmi/Screans/Welcome_Screan.dart';
import 'package:bmi/blocs/BmiCalculate/bmi_claculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return
          MultiBlocProvider(

            providers: [
              BlocProvider(create: (context)=>BmiClaculateCubit() )
        ],

              child:           MaterialApp(
                debugShowCheckedModeBanner: false,

theme: ThemeData(
  useMaterial3: true
),
                home: child,
              )


          );


      },
      child: WelcomeScrean(),
    );
  }
}

