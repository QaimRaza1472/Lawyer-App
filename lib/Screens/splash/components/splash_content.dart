import 'package:flutter/material.dart';
import 'package:testing_login_page/Theme/colors.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Lawyer App",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor1,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5,),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
