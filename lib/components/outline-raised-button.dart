import 'package:flutter/material.dart';
import 'package:flutterloginui/constants.dart';

class OutlineRaisedButton extends StatefulWidget {
  final Function onPressed;
  final String btnContent;

  const OutlineRaisedButton({Key key, this.onPressed, this.btnContent})
      : super(key: key);

  @override
  _OutlineRaisedButtonState createState() => _OutlineRaisedButtonState();
}

class _OutlineRaisedButtonState extends State<OutlineRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kButtonColor,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: widget.onPressed,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(
            widget.btnContent,
            style: TextStyle(color: kButtonColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
