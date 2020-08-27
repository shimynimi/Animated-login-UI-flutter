import 'package:flutter/material.dart';
import 'package:flutterloginui/components/text-field-container.dart';
import 'package:flutterloginui/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Enter Password',
          border: InputBorder.none,
          icon: Icon(
            Icons.lock,
            color: kButtonColor,
          ),
        ),
      ),
    );
  }
}
