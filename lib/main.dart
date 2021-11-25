import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'package:responsive2/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sizer",
          theme: ThemeData.dark(),
          home: HomePage());
    });
  }
}
