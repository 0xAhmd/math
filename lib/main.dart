import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/factorial_page.dart';

//
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[200],
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.blueAccent,
          backgroundColor: Colors.grey[200],
        ),
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const FactorialPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
