import 'package:flutter/material.dart';
import 'package:flutterloginui/constants.dart';

class PrimaryRaisedButton extends StatefulWidget {
  final Function onPressed;
  final String buttonContent;

  const PrimaryRaisedButton({Key key, this.onPressed, this.buttonContent})
      : super(key: key);

  @override
  _PrimaryRaisedButtonState createState() => _PrimaryRaisedButtonState();
}

class _PrimaryRaisedButtonState extends State<PrimaryRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: widget.onPressed,
        color: kButtonColor,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(
            widget.buttonContent,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
