
import 'package:complainbox/backenddata.dart';
import 'package:complainbox/uid.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ComplainArea extends StatefulWidget {
  @override
  _ComplainAreaState createState() => _ComplainAreaState();
}

class _ComplainAreaState extends State<ComplainArea> {
 Widget ComplainArea(){
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Colors.white,
        elevation: 10.0,
              child: Container(
                margin: EdgeInsets.all(10.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[


          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton.icon(onPressed: (){
                  getImage(true);
                  }, icon: Icon(Icons.camera_alt),
                    label: Text('Add pic')),
                RaisedButton.icon(onPressed: (){

                }, icon: Icon(Icons.place),
                    label: Text('location')),
              ],
            ),



                    Center(child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Form(
                          key:_formkey,
                          child: TextFormField(

                            validator: (val)=>val.isEmpty?'enter complaint':null,
                            decoration: InputDecoration(
                              hintText: 'complain',
                              prefixIcon: Icon(Icons.create),

                            ),
                            onChanged: (val){
                              setState(() {
                                complain=val;
                              });
                            },
                          ),
                        ))),
                    _image==null?Container():Column(
                      children: <Widget>[
                        Image.file(_image,height: 200,width: 200,),
                        SizedBox(height: 20,),
                        FlatButton.icon(onPressed: ()async{
                         if( _formkey.currentState.validate()) {
                          // await e.updateUserData(complain);
                           final ref = FirebaseStorage.instance.ref().child('gs://complainboxapp2.appspot.com/');
                           ref.putFile(_image);
                           _formkey.currentState.reset();
                           setState(() {
                             _image = null;


                           });
                         }
                          },
                            icon: Icon(Icons.file_upload),
                            label: Text('SUBMIT'))
                      ],
                    )


                  ],),),
      ),

    );
    }

    final _formkey= GlobalKey<FormState>();
    String complain='';
 //   final e= BackendData();


    //capture image function
 File _image;
 Future getImage(bool isCamera) async{
   File image;
   if(isCamera){
     image= await ImagePicker.pickImage(source: ImageSource.camera);

   }
   else {
     image = await ImagePicker.pickImage(source: ImageSource.gallery);
   }
   setState(() {
     _image=image;
   });
 }


  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ComplainArea()
    ],);
  }
}