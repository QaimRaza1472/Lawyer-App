//screen no 16

import 'package:flutter/material.dart';
import 'package:testing_login_page/Screens/reset_password.dart';
import 'package:testing_login_page/Theme/colors.dart';
import 'package:testing_login_page/background/background.dart';
import 'Login/Components/rounded_button.dart';
import 'Login/Components/rounded_input.dart';
import 'Login/Components/rounded_password_input.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    Size size =MediaQuery.of(context).size;

    double defaultLoginSize = size.height -(size.height*0.2);

    return BackgroundWidget(
        showbackground: true,
        showCircle1: true,
        contentScreen: Container(
          width: width1,
          height: height1,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height1 * 0.16,),

                Align(
                  alignment: Alignment.topCenter,
                  child:  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      width: width1,
                      //height: defaultLoginSize,
                      height: height1*0.812,

                      //color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Forgot Your",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 29,
                            ),
                          ),
                          const SizedBox(height: 2,),
                          const Text("Password?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 29,
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Image.asset(
                            'assets/logInImage.png',
                            scale: 3.3,
                          ),
                          const SizedBox(height: 40,),
                          const RoundInput(icon:Icons.mail,hint: "Email",),
                          const SizedBox(height: 3,),
                          RoundedButton(title: "Reset Password",
                            pressd: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        topNavigation: Positioned(
          top: 20,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: kwhiteColor,
            ),
          ),
        ),
    );
  }
}
