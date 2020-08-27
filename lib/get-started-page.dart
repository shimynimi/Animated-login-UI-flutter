import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'components/outline-raised-button.dart';
import 'components/primary-raised-button.dart';
import 'components/rounded-input-field.dart';
import 'components/rounded-password-field.dart';
import 'constants.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  //0 is for get started page
  //1 is for login page
  //2 is for sign up page
  int _pageState = 0;
  Color _backgroundColor = Colors.white;
  Color _headingColor = Colors.black;
  double windowWidth = 0;
  double windowHeight = 0;
  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _loginWidth = 0;
  double _loginOpacity = 1;
  double _registerYOffset = 0;
  double _registerHeight = 0;
  double _loginHeight = 0;
  double _headingTop = 0;
  bool _keyboardVisibility = false;

  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        _keyboardVisibility = visible;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    windowHeight = size.height;
    windowWidth = size.width;
    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        //get started page
        _backgroundColor = Colors.white;
        _headingColor = Colors.black;
        _loginYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginHeight = _keyboardVisibility ? windowHeight : windowHeight - 270;
        _loginOpacity = 1;
        _registerYOffset = windowHeight;
        _headingTop = size.height * 0.08;
        break;

      case 1:
        //login page
        _backgroundColor = kLoginPageColor;
        _headingColor = Colors.white;
        _loginYOffset = _keyboardVisibility ? 40 : 270;
        _loginHeight = _keyboardVisibility ? windowHeight : windowHeight - 270;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _registerYOffset = windowHeight;
        _headingTop = size.height * 0.07;
        break;

      case 2:
        //sign in page
        _backgroundColor = kLoginPageColor;
        _headingColor = Colors.white;
        _loginYOffset = _keyboardVisibility ? 30 : 240;
        _loginXOffset = size.width * 0.04;
        _loginWidth = size.width * 0.92;
        _loginHeight = _keyboardVisibility ? windowHeight : windowHeight - 240;
        _loginOpacity = 0.7;
        _registerYOffset = _keyboardVisibility ? 55 : 270;
        _registerHeight =
            _keyboardVisibility ? windowHeight : windowHeight - 220;
        _headingTop = size.height * 0.06;
        break;
    }

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(top: _headingTop),
                        child: Text(
                          'Enjoy Reading',
                          style: TextStyle(
                            fontSize: 34,
                            color: _headingColor,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'We make reading more enjoyable. Join us to find the most suitable book for yourself.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: _headingColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Center(
                  child: _pageState == 0
                      ? Image.asset("assets/images/get-started-image.jpg")
                      : Text(''),
                ),
              ),
              PrimaryRaisedButton(
                onPressed: () {
                  setState(
                    () {
                      if (_pageState != 0) {
                        _pageState = 0;
                      } else {
                        _pageState = 1;
                      }
                    },
                  );
                },
                buttonContent: 'Get Started',
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 2;
            });
          },
          child: AnimatedContainer(
            width: _loginWidth,
            height: _loginHeight,
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            transform:
                Matrix4.translationValues(_loginXOffset, _loginYOffset, 0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 32),
                      child: Text(
                        'Login To Continue',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    RoundedInputField(
                      onChanged: (value) {},
                      hintText: "Enter Email",
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.12,
                ),
                Column(
                  children: [
                    PrimaryRaisedButton(
                      buttonContent: "Login",
                      onPressed: () {},
                    ),
                    OutlineRaisedButton(
                      onPressed: () {},
                      btnContent: 'Create  New Account',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 1;
            });
          },
          child: AnimatedContainer(
            height: _registerHeight,
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            transform: Matrix4.translationValues(0, _registerYOffset, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 32),
                      child: Text(
                        'Create New Account',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    RoundedInputField(
                      onChanged: (value) {},
                      hintText: 'Enter Email',
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.12,
                ),
                Column(
                  children: [
                    PrimaryRaisedButton(
                      buttonContent: "Create Account",
                      onPressed: () {},
                    ),
                    OutlineRaisedButton(
                      onPressed: () {},
                      btnContent: 'Back To Login',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
