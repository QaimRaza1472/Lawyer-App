import 'package:flutter/material.dart';
import 'package:testing_login_page/Theme/colors.dart';

import 'input_container.dart';



class RoundInput extends StatelessWidget {
  const RoundInput({Key key, @required this.icon,@required this.hint }) : super(key: key);

  final IconData icon;
  final String hint;

 
  @override
  Widget build(BuildContext context) {
    return  InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor1,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor1,
            ),
            hintText: hint,
            border: InputBorder.none
        ),
      ),
    );
  }
}
