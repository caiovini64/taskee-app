import 'package:flutter/material.dart';
import 'package:taskee/provider/task_provider.dart';
import 'views/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          dividerColor: Color(0xffDFE3E7),
          primaryColor: Color(0xff4B3589),
          primaryColorLight: Color(0xfF6FB8FC),
          disabledColor: Color(0xffDFE3E7),
          textTheme: TextTheme(
            headline1: GoogleFonts.majorMonoDisplay(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            headline2: GoogleFonts.raleway(
              color: Color(0xff424242),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
