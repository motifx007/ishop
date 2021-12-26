import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/views/ui/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.nunito().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline2: TextStyle(fontSize: 60, color: Colors.black,),
          headline1: TextStyle(fontSize: 96, color: Colors.black,),
          headline3: TextStyle(fontSize: 48, color: Colors.black,),
          headline4: TextStyle(fontSize: 34, color: Colors.black, fontWeight: FontWeight.w600),
          headline5: TextStyle(fontSize: 24, color: Colors.black,),
          headline6: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
          subtitle1: TextStyle(fontSize: 16, color: Colors.black, ),
          subtitle2: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 10, color: Colors.black,),
        )
      ),
      home: const Login(),
    );
  }
}