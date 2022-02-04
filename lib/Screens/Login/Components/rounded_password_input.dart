import 'package:flutter/material.dart';
import 'package:testing_login_page/Theme/colors.dart';

import 'input_container.dart';



class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key key,this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return  InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: hint,
            border: InputBorder.none
        ),
      ),
    );
  }
}
