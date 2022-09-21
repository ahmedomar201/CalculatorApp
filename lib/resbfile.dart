import 'package:flutter/material.dart';
class  ReusableButton extends StatelessWidget {
  ReusableButton({this.label,this.color,this.onPressed,this.hightRatio});
  final String label;
  final Color color;
  final Function  onPressed;
  final double hightRatio ;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: (hightRatio==null)?MediaQuery.of(context).size.height*0.1 :MediaQuery.of(context).size.height*hightRatio,

      margin: EdgeInsets.all(2.0),
      child: MaterialButton(
        color:color,
          onPressed:onPressed,
      child: Text(label,style: TextStyle(
        color: Colors.white,fontSize: 25
      ),),
      ),
    );
  }
}
