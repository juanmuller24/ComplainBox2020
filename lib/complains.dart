import 'package:flutter/material.dart';


class Complains extends StatefulWidget {
  @override
  _ComplainsState createState() => _ComplainsState();
}

class _ComplainsState extends State<Complains> {
Widget Complains(){
  return
  Padding(padding: EdgeInsets.all(10.0),
    child: Material(
      elevation: 20.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Center(child: Text('COMPLAIN',style: TextStyle(fontSize: 20.0),)),
          SizedBox(height: 20.0,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('AREA: '),
              Text('FROM: ')
            ],),
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('DEPARTMENT'),
              Row(
                children: <Widget>[
                  Text('Solved: '), Icon(Icons.done,color: Colors.green,)
                ],
              ),
             
            ],
          ),
      ],
       
      )
    ,),)
    );
}
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Complains()
    ],);
  }
}