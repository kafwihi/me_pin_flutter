import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFB415B),

      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(

      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 100.0,right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Logo',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 40.0,),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),

            ),
            SizedBox(height: 40.0,),
            buildTextField("Email"),
            SizedBox(height: 20.0,),
             buildTextField("Password"),
              SizedBox(height: 20.0,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Forgotten Password",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height:50.0),
              buildButtonContainer(),
              SizedBox(height:10.0),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't  have an account?"),
                      SizedBox(width:10.0),
                      Text("Sign Up", style: TextStyle(color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
    Widget buildTextField(String hintText){
      return TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password" ? IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility_off),
          ): Container()
        ),
      );
    }


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
    ),
    child: Center(
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ),
  );
}
}
