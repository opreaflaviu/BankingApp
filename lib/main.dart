import 'package:banking_app/pages/form_screen.dart';
import 'package:banking_app/pages/personal_information_screen.dart';
import 'package:banking_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Color.fromARGB(100, 84, 41, 150),
        accentColor: Color.fromARGB(50, 84, 41, 150),
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/splash_screen_page': (context) => SplashScreen(),
        '/form_page': (context) => FormScreen(),
        '/personal_info_page': (context) => PersonalInformationScreen(),
      },
      initialRoute: '/splash_screen_page'
    );
  }
}
