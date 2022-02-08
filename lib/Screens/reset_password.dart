//screen no 16

import 'package:flutter/material.dart';
import 'package:testing_login_page/Theme/colors.dart';
import 'package:testing_login_page/background/background.dart';
import 'Login/Components/rounded_button.dart';
import 'Login/Components/rounded_input.dart';
import 'Login/Components/rounded_password_input.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

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
                alignment: Alignment.center,
                child:  SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    width: width1,

                    height: height1*0.812,
                   // height: height1,
                    //height: defaultLoginSize,
                    //color: Colors.yellow,

                    // color: Colors.yellow,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Reset Your",
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
                        const SizedBox(height: 30,),
                        const RoundInput(icon:Icons.mail,hint: "Email",),
                        RoundedPasswordInput(hint: "New Password",),

                        RoundedPasswordInput(hint: "Confirm New Password",),

                        const SizedBox(height: 3,),
                        RoundedButton(title: "Confirm",
                          pressd: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
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
