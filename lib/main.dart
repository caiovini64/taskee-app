import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: Color(0xffDFE3E7),
        primaryColor: Color(0xff4B3589),
        primaryColorLight: Color(0xfF6FB8FC),
        textTheme: TextTheme(
          headline1: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline2: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
