import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_login_page/Theme/colors.dart';

class BackgroundWidget extends StatefulWidget {
  bool showbackground = true;
  bool showCircle1 = true;
  Container contentScreen = null;
  var topNavigation = null;

  BackgroundWidget(
      {Key key,
      @required this.showbackground,
      @required this.showCircle1,
      @required this.contentScreen,
      @required this.topNavigation})
      : super(key: key);

  _BackgroundScafoldState createState() => _BackgroundScafoldState();
}

class _BackgroundScafoldState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /// When clicked on the search icon - right next to < Report word. make the value as 120.0
    Orientation orientation = MediaQuery.of(context).orientation;
    List<Widget> stack_childerns = [];
    /////////////////////////////////////////////     Background     //////////////////////////////////
    if (widget.showbackground) {
      stack_childerns.add(
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
      );
    }
    if (widget.showCircle1) {
      stack_childerns.add(
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
      );
    }

    ///////////////////////////////////////     Content View     /////////////////////////////
    if (widget.contentScreen != null) {
      stack_childerns.add(widget.contentScreen);
    }
    /////////////////////////////////////// Content VIEW End ////////////////////////////////////////////

    /////////////////////////////////////// Top Navigation  //////////////////////
    if (widget.topNavigation != null) {
      stack_childerns.add(widget.topNavigation);
    }
    /////////////////////////////////////// Top Navigation  //////////////////////
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: stack_childerns,
      ),
    );
  }
}
