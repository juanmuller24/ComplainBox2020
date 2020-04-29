import 'package:complainbox/auth.dart';
import 'package:complainbox/complainarea.dart';
import 'package:complainbox/loginpage.dart';
import 'package:flutter/material.dart';
class ComplainPage extends StatefulWidget {
  @override
  _ComplainPageState createState() => _ComplainPageState();
}

class _ComplainPageState extends State<ComplainPage> {
  final e =Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: <Widget>[
        FlatButton.icon(onPressed: ()async{
          final result = await e.signOutGmail();
          if(result==0)
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context){
                  return LoginPage();
                }
            ));
        },
            icon: Icon(Icons.person_outline),
            label: Text('Sign Out'))

      ],
      title: Text('Complain Page'),),
      body: ComplainArea()
      );
  }
}