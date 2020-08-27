import 'package:flutter/material.dart';
import 'get-started-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Animated Login UI',
        theme: ThemeData(
          fontFamily: "Nunito",
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: GetStartedPage(),
          ),
        ));
  }
}
