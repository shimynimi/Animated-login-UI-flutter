import 'package:flutter/material.dart';
import 'package:flutterloginui/components/text-field-container.dart';
import 'package:flutterloginui/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.email,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            icon,
            color: kButtonColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
