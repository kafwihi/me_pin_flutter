import 'dart:convert';

import 'package:flutter/material.dart';
import 'api_service.dart';
import 'login.dart';
//register form

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage()
      },
      theme: ThemeData(
        primaryColor: Color(0xFFFB415B),

      ),
      home: LoginPage(),
    );
  }
}

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  bool _isLoading = false;
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _nationalid= TextEditingController();
  final _mobile= TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 30.0,right: 20.0, left: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Register",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),

            ),
            SizedBox(height: 10.0,),
            buildTextField("First Name",false,_firstname),
            SizedBox(height: 10.0,),
             buildTextField("Second Name",false,_lastname),
              SizedBox(height: 10.0,),
             buildTextField("National ID",false,_nationalid),
              SizedBox(height: 10.0,),
             buildTextField("Mobile",false,_mobile),
              SizedBox(height: 10.0,),
             buildTextField("Email",false,_email),
              SizedBox(height: 10.0,),
             buildTextField("Password",true,_password),
              SizedBox(height: 10.0,),
            // buildTextField("Confirm Password",true),
              //SizedBox(height: 10.0,),

              buildButtonContainer(),

              SizedBox(height: 10.0,),
             forgotLabel,
              SizedBox(height:10.0),

          ],
        ),
      ),
    );
  }
    Widget buildTextField(String hintText,boolean,_titleController,){
      return TextField(
        controller: _titleController,
        obscureText: boolean,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

        ),

      );
    }


final forgotLabel = FlatButton(
  child: Text(
    'Login',
    style: TextStyle( color: Colors.black54),
  ),
  onPressed: () {
 // Navigator.of(context).pushNamed('/login');

  },
);

/*

final loginButton = Padding(
  padding: EdgeInsets.symmetric(vertical: 16.0),
  child: Material(
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.lightBlueAccent.shade100,
    elevation: 5.0,
    child: MaterialButton(
      minWidth: 200.0,
      height: 42.0,
      onPressed:  () {
          Navigator.of(context).pushNamed(HomePage.tag);
      },
      color: Colors.lightBlueAccent,
      child: Text('Login', style: TextStyle(color: Colors.white),),
    ),
  ),
);
*/
Widget buildButtonContainer(){
  return Container(
    height: 56.0,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(23.0),
      gradient: LinearGradient(
        colors: [
          Color(0xFFFB415b),
          Color(0xFFE5623),
        ],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft
        )
    )
    ,child: GestureDetector(
      onTap: () {

                if(_firstname.text.isEmpty ||_lastname.text.isEmpty ||_mobile.text.isEmpty ||
                _email.text.isEmpty ||_nationalid.text.isEmpty ||
                 _password.text.isEmpty){
                  showDialog(
                    builder: (context) => AlertDialog(
                      title: Text('Failure'),
                      content: Text('Fill in All Needed values'),
                      actions: <Widget>[ FlatButton(
                        onPressed: () { Navigator.pop(context);},
                        child: Text('Ok'),
                      )],
                    ),
                    context: context
                  );
                  return;
                }

                  final new_user = {
                 'nationalid': _nationalid.text,
                  'firstname': _firstname.text,
                  'lastname':_lastname.text,
                 'phone': _mobile.text,
                  'email': _email.text,
                  'password':_password.text
                };
               /* var new_userm = {
                 "nationalid": _nationalid.text,
                  "firstname": _firstname.text,
                  "lastname":_lastname.text,
                 "phone": _mobile.text,
                  "email": _email.text,
                  "password":_password.text
                };*/

final us =json.encode(new_user);
                setState(() {
                 _isLoading = true;
                 print('loading $_isLoading');
                });
                ApiService.addKeyUser(new_user)
                .then((success){
                   setState(() {
                 _isLoading = false;
                });
print('success entry $success');
final us =json.encode(new_user);
print('new member $us');
                  String title, text;
                  if(success){
                    title = "Success";
                    text = "User Submitted";
                  }
                  else {
                    title = "Error x";
                    text = "Error Submitting";
                  }
                   showDialog(
                    builder: (context) => AlertDialog(
                      title: Text(title),
                      content: Text(text),
                      actions: <Widget>[ FlatButton(
                        onPressed: () { Navigator.pop(context);},
                        child: Text('Ok'),
                      )],
                    ),
                    context: context
                  );
                });


      },//end tap here
      child: Text(
        "Submit",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ),

  );
}
}
/**
 *  child: GestureDetector(
      onTap: () {},
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    )
 */