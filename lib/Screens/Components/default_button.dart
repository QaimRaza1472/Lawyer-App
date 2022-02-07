import 'package:flutter/material.dart';
import 'package:testing_login_page/Theme/colors.dart';
import '../../constants.dart';
import '../../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    var height1=MediaQuery.of(context).size;
    var width1=MediaQuery.of(context).size.width;

    return SizedBox(

      //width: double.infinity,
      width: width1*0.85,
      height: getProportionateScreenHeight(52),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27),
              ),
          primary: Colors.white,
          backgroundColor: kPrimaryColor1,
        ),
        onPressed: press as void Function(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
