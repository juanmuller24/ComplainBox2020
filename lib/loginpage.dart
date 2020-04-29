import 'package:flutter/material.dart';
import 'package:complainbox/auth.dart';
import 'package:complainbox/home.dart';





class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final e= Auth();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          //padding: EdgeInsets.all(150),
          child: FlatButton(
            onPressed: ()async{
              final result = await e.testSignInWithGoogle();
              if(result==0)
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context){
                      return Home();
                    }
                ));
              else
                print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
            },
            color: Colors.blue,
            child:Text('Gmail Signin'),
          ),
        ),
      ),
    );
  }
}
