


import 'package:databasesqflite/sqflite_login/login.dart';
import 'package:databasesqflite/sqflite_login/signup.dart';
import 'package:flutter/material.dart';

class Login_Signup extends StatefulWidget {
  const Login_Signup({Key? key}) : super(key: key);

  @override
  State<Login_Signup> createState() => _Login_SignupState();
}

class _Login_SignupState extends State<Login_Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text("welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            Padding(

              padding: const EdgeInsets.all(25.0),
             // child: Text(
              // "Automatic identity verification which enable you to verify your identity",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
            ),
            Image.network('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?w=2000'),


            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade700),
                    minimumSize: MaterialStateProperty.all(Size(330, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_Form()));
                  }, child: Text("Already a user",style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(height: 30,),
           ElevatedButton(
                style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: MaterialStateProperty.all(Size(330, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),

                        )
                    )
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup_Form()));
                }, child: Text("Not a user.? Sign Up",style: TextStyle(color: Colors.black),)),
          ],
        ),
      ),
    );
  }
}