import 'package:bmi/Screans/hight__screan.dart';
import 'package:bmi/utils/Nafigator.dart';
import 'package:flutter/material.dart';
    
class GenderButton extends StatelessWidget {

  String? text;
  String? image;
  GenderButton({this.text ,this.image});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if (text=='male'){
        navigateToScreen(context, HightScrean(text: text, image: image,));
      }else{
        navigateToScreen(context, HightScrean(text: text,image: image));
      }
    },
    style: ElevatedButton.styleFrom(
      fixedSize: Size(200, 200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white
    ),
     child:Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: [
        Image.asset(image!,height: 100,),
        Text(text!,style: TextStyle(
          fontSize: 20,
          color: Colors.black
        ),)
      ],
     ));
  }
}