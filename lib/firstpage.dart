import 'package:diff_app/resbfile.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String equation="0";
  String result ="0";
  String expression='';
  void Calculate(String text){
    setState(() {
      if(text=='C'){
        equation=null;
        result="0";
      }
      else if(text=='⌫'){
        equation=equation.substring(0,equation.length-1);
        //الزورار ده بنعملو عشان بنمسح الارقام رقم رقم كدة زي الالة الحاسبة
        // فابد بصفر اهو
        if(equation==""){
          equation="0";
        }
      }
      else if(text=='=') {
        equation = equation.replaceAll('x', '*');
        equation = equation.replaceAll('÷', '/');
        expression=equation;
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      }

      else{
        if(equation==null){
          equation="";
          equation=equation+text;
        }
        else{
          equation=equation+text;
        }
      }


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:  Text(equation??"0",style: TextStyle(fontSize: 50),),
            alignment: Alignment.topRight,

          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:  Text(result,style: TextStyle(fontSize: 50),),
            alignment: Alignment.topRight,
          ),
          Expanded(child: SizedBox(

          ),),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                //بياخد اد ايه من الاسكرينة لو في اتنين كونينر مع بعض
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          ReusableButton(
                            color: Colors.red, label: 'C', onPressed:()=>Calculate('C'),),
                          ReusableButton(
                            color: Colors.lightBlue, label: '⌫', onPressed:()=>Calculate('⌫'),),
                          ReusableButton(
                            color: Colors.lightBlue, label: '÷', onPressed:()=>Calculate('÷'),),
                        ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(color: Colors.black45,
                            label: '7',
                            onPressed
                                :()=>Calculate('7'),),
                          ReusableButton(
                            color: Colors.black45, label: '8', onPressed:()=>Calculate('8'),),
                          ReusableButton(
                            color: Colors.black45, label: '9', onPressed:()=>Calculate('9'),),
                        ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(
                            color: Colors.black45, label: '4', onPressed:()=>Calculate('4'),),
                          ReusableButton(
                            color: Colors.black45, label: '5', onPressed:()=>Calculate('5'),),
                          ReusableButton(
                            color: Colors.black45, label: '6', onPressed:()=>Calculate('6'),),
                        ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(
                            color: Colors.black45, label: '1', onPressed:()=>Calculate('1'),),
                          ReusableButton(
                            color: Colors.black45, label: '2', onPressed:()=>Calculate('2'),),
                          ReusableButton(
                            color: Colors.black45, label: '3', onPressed:()=>Calculate('3'),),
                        ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(
                            color: Colors.black45, label: '.', onPressed:()=>Calculate('.'),),
                          ReusableButton(
                            color: Colors.black45, label: '0', onPressed:()=>Calculate('0'),),
                          ReusableButton(
                            color: Colors.black45, label: '00', onPressed:()=>Calculate('00'),),
                        ],
                    ),

                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                //بياخد اد ايه من الاسكرينة لو في اتنين كونينر مع بعض
                child: Table(
                children: [
                  TableRow(
                      children: [ReusableButton(
                        color: Colors.lightBlue, label: 'X', onPressed:()=>Calculate('x'),),
                      ]
                  ),
                  TableRow(
                      children: [ReusableButton(
                        color: Colors.lightBlue, label: '-', onPressed:()=>Calculate('-'),),
                      ]
                  ),
                  TableRow(
                      children: [ReusableButton(
                        color: Colors.lightBlue, label: '+', onPressed:()=>Calculate('+'),),
                      ]
                  ),
                  TableRow(
                      children: [ReusableButton(
                        color: Colors.red, label: '=', onPressed:()=>Calculate('='),hightRatio:0.205,),
                      ]
                  ),


                ],
              ),


              ),
            ],
          )
        ],
      ),

    );
    }
} 