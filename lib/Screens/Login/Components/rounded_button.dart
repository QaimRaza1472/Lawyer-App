import 'package:flutter/material.dart';
import 'package:testing_login_page/Theme/colors.dart';



class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.title,
    @required this.pressd
  }) : super(key: key);

  final String title;
  final VoidCallback pressd;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return InkWell(
      onTap: pressd,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor1,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(title,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 18,

          ),
        ),
      ),
    );
  }
}
