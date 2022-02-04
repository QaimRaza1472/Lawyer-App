//screen no 16
import 'package:flutter/material.dart';
import 'package:testing_login_page/background/background.dart';

class Testing extends StatefulWidget {



  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {




  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    return BackgroundWidget(
        showbackground: true,
        showCircle1: true,
        contentScreen: Container(
          width: width1,
          height: height1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: height1 * 0.06,
              ),
              const Text(
                'Unlock "NANSHE" with your face ID ',
                style: TextStyle(
                    color: Color(0xff797575),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),

              SizedBox(
                height: orientation == Orientation.portrait
                    ? height1 * 0.38
                    : height1 * 0.1,
              ),

              //button

            ],
          ),
        ),
        topNavigation: Positioned(
          top: 20,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xff00355D),
            ),
          ),
        ));
  }
}
