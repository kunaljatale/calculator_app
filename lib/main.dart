
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_app/constante/colors.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
} 

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}


 
class _CalculatorAppState extends State<CalculatorApp> {

 
double firstNum=0.0;
double secondNum=0.0;
var input ='';
var output ='';
var operation='';


 buttonclicked(value){
if(value=="AC"){
 input='';
 output='';
}else if(value=='<'){
// input =input.substring(0,input.length-1);

  if(input.isNotEmpty){
      input=input.substring(0,input.length-1);
  }

}else if(value=="="){
  if(input.isNotEmpty){
  var userInput =input;
  userInput =input.replaceAll("X", "*");
  Parser p=Parser();
  Expression expresion =p.parse(userInput);
 ContextModel cm =ContextModel();
 var finalvalue= expresion.evaluate(EvaluationType.REAL,cm);
 output =finalvalue.toString();


 input=output;
  }

}else{
  input =input+value;
}
 setState(() {
   
 });
  

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
            Expanded(
              child: Container(
                width: double.infinity,
                // height: 10,
                padding: EdgeInsets.all(12),
          color: Colors.red,
           
           child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
        Text(input, style: TextStyle(color: Colors.white,
        fontSize: 48
        ),
        
        ),
        SizedBox(height: 20,),
         Text(output, style: TextStyle(color: Colors.white.withOpacity(0.7),
        fontSize: 18 
        ),
        ),
        SizedBox(height: 30,),


            ],
           ),
           )
        ),

        //button area
        Row(
          children: [
            button(text: "AC",buttonbgcolor: operatorColor,tcolor: orangeColor),
            button(text: "<",tcolor: orangeColor),
            button(text: "",tcolor: orangeColor),
            button(text: "/",tcolor: orangeColor),



          ],
        ),
          
                Row(
          children: [
            button(text: "7"),
            button(text: "8"),
            button(text: "9"),
            button(text: "X",tcolor: orangeColor),



          ],
        ),
                Row(
          children: [
            button(text: "4"),
            button(text: "5"),
            button(text: "6"),
            button(text: "-",tcolor: orangeColor),



          ],
        ),
                Row(
          children: [
            button(text: "1"),
            button(text: "2"),
            button(text: "3"),
            button(text: "+",tcolor: orangeColor),



          ],
        ),
                Row(
          children: [
            button(text: "%"),
            button(text: "0"),
            button(text: "."),
            button(text: "=",buttonbgcolor: Colors.orange),



          ],
        ),
      ],) ,
    );
  }


button({text,tcolor=Colors.white, buttonbgcolor= buttonColor}){
  return Expanded(child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12) ),
                backgroundColor: buttonbgcolor,
                padding: EdgeInsets.all(22),

                  
                ),
                onPressed: ()=>buttonclicked(text), child: Text(text,style: TextStyle(
                  fontSize: 18,
                  color: tcolor,
                  fontWeight: FontWeight.bold,
                ),),

              
                        ),
            )
          );


  }
}