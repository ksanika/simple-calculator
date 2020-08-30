import 'dart:developer';

import 'package:flutter/material.dart';

class CalculateandDisplay extends StatefulWidget {
  @override
  _CalculateandDisplayState createState() => _CalculateandDisplayState();
}

class _CalculateandDisplayState extends State<CalculateandDisplay> {

int num1 , num2 ;
String texttodisplay = "";
String res ="";
String operation="";

int counter=0;
  String display="" , answer = "";
  List<String> buttons =[
    "C",
    "=",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "+",
    "-",
    "*",
    "/"
  ];

  void buttonPressedandAction(buttons)
  {
    print ("buttons value in method called on tap : " + buttons);
    setState(() {
      if(buttons == "C")
      {
        num1 =0;
        num2=0;
        res="";
        texttodisplay="";
        display = "";
      }
      else if(buttons == "+" || buttons == "-" || buttons == "*" || buttons == "/")
      {
        num1 = int.parse(display);
        res="";
        operation = buttons;
        print("inside + if");
      }
      else if(buttons == "=")
      {
        //print("inside = if");
        num2=int.parse(display);
        if(operation == "+")
        {
        //  print("inside operation +");
          res= (num1 + num2).toString();
        }
        else if(operation == "-")
        {
//print("inside operation +");
          res= (num1 - num2).toString();
        }
        else if(operation == "*")
        {
           print("inside operation *");
          res= (num1 * num2).toString();
        }
        else if(operation == "/")
        {
          // print("inside operation +");
          res= (num1 ~/ num2).toString();
        }
      }
      else{
        print("inside else");
        res = int.parse(display + buttons).toString();
      }
      display = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate',
        style: TextStyle(
          color: Color(0xFFF3B63A)
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                    child:Text(
                      display,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex:2,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: buttons.length,
                itemBuilder: (BuildContext context , index){
                  return RaisedButton(
                    splashColor: Colors.pink[300],
                     child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.0,
                      height: 70.0,
                      child: new Text(buttons[index],
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                      ),
                    ),
                    onTap: (){
                      buttonPressedandAction(buttons[index]);
                    },
                    behavior: HitTestBehavior.translucent,
                    ),
                    onPressed: (){},// => print('onPressed'),
                    color: Color(0xFFF3B63A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    // child: new Text(buttons[index],
                    // style: TextStyle(
                    //   fontSize: 20.0
                    // ),
                    // ),
                    // color: Color(0xFFF3B63A),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30)
                    // ),
                    // onPressed: (){
                    //   print('RaisedButton');
                    // },
                  );
                },
             ),
            ),
          ),
        ],
      ),
    );
  }
}