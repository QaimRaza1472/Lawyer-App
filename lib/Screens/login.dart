import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_login_page/Screens/forgot_password.dart';
import 'package:testing_login_page/Theme/colors.dart';
import 'Login/Components/rounded_button.dart';
import 'Login/Components/rounded_input.dart';
import 'Login/Components/rounded_password_input.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {

  bool isLogin = true;
  Animation<double> containerSize;
  AnimationController animationController;
  Duration animationDuration = const Duration(microseconds: 270);
  
  
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    animationController = AnimationController(vsync: this,duration: animationDuration);
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    var height1=MediaQuery.of(context).size.height;
    var width1=MediaQuery.of(context).size.width;
    Size size =MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;//We are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height -(size.height*0.2);
    double defaultRegisterSize = size.height -(size.height*0.1);

    containerSize =Tween<double>(begin: size.height* 0.1, end:defaultRegisterSize).animate(CurvedAnimation(parent: animationController, curve: Curves.linear));


    return Scaffold(
      body: Stack(
        children: [
          ///                   Decoration       ///////////////////////////////
          ///

         Positioned(
           top: 100,
           right: -50,
           child: Container(
             width: 120,
             height: 120,
             decoration:  const BoxDecoration(
               shape: BoxShape.circle,
               //borderRadius: BorderRadius.circular(70),
               color: kPrimaryColor1,
             ),
             ),
         ),

         //////////////////////////////////////////////////////////////////////

          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kPrimaryColor1,
              ),
            ),
          ),




         // Cancel Button
          AnimatedOpacity(
            opacity: isLogin ?0.0 : 1.0,
            duration: animationDuration,
            child: Align(
             alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height*0.1,
                alignment: Alignment.bottomCenter,
                child: IconButton(
                    onPressed:isLogin ? null : (){
                      animationController.reverse();
                    setState(() {
                       isLogin= ! isLogin;
                    });
                    },
                    icon:  Icon(Icons.close,
                      color: kPrimaryColor1,
                    ),
                ),
              ),
            ),
          ),
          ///                                  Login form

          AnimatedOpacity(
            opacity: isLogin?1.0 : 0.0,
            duration: animationDuration*4,
            child: Align(
              alignment: Alignment.center,
              child:  SingleChildScrollView(
                 physics: BouncingScrollPhysics(),
                child: Container(
                  width: size.width,
                  height: defaultLoginSize,
                  //color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("LOGIN",
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
                      RoundInput(icon:Icons.mail,hint: "Username",),
                      RoundedPasswordInput(hint: "Password",),

                      //const SizedBox(height: 0,),
                      Padding(
                        padding:  EdgeInsets.only(right:width1*0.1),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                            },
                            child: Text("Forget Password",
                              style: TextStyle(
                                color: kPrimaryColor1

                              ),
                            ),
                          ),
                        ),
                      ),
                      //const SizedBox(height: 0,),

                      RoundedButton(title: "LOGIN",
                        pressd: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                      },),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //////////////////////////////    Register Container  ///////////////////////
          AnimatedBuilder(
            animation: animationController,
            builder: (context,child){
              if(viewInset == 0 && isLogin){
                return buildRegisterContainer();
              }else if(!isLogin){
                return buildRegisterContainer();
              }
              return Container();
            },
          ),

          ///                        Register Form            ////////////////
          AnimatedOpacity(
            opacity: isLogin ?0.0:1.0,
            duration: animationDuration* 5,
            child: Visibility(
              visible: !isLogin,
              child: Align(
                alignment: Alignment.center,
                child:  SingleChildScrollView(
                  //physics: BouncingScrollPhysics(),
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    //color: Colors.yellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("SIGN UP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 40,),
                        Image.asset(
                          'assets/logInImage.png',
                          scale: 3.3,
                        ),
                        const SizedBox(height: 40,),
                        RoundInput(icon:Icons.mail,hint: "Username",),
                        RoundedPasswordInput(hint: "Password",),

                        RoundedPasswordInput(hint: "Confirm Password",),

                        //  RoundInput(icon:Icons.face,hint: "Name",),

                        const SizedBox(height: 10,),
                        RoundedButton(title: "SIGN UP",),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }



Widget buildRegisterContainer(){
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: kBackgroundColor,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap:!isLogin ? null : (){
            animationController.forward();
            setState(() {
              isLogin = !isLogin;
            });
          },
          child:isLogin ?
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Don't have an account ?",
                style: TextStyle(
                  color: kPrimaryColor1,
                  fontSize: 17,
                ),
          ),
               Text(" Sign up",
                 style: TextStyle(
                   color: kPrimaryColor1,
                   fontSize: 18,
                 fontWeight: FontWeight.bold,
                 ),
               ),
             ],
           ):null
        ),
      ),
    );

  }

}
