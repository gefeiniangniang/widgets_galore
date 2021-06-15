import 'package:flutter/material.dart';
import 'package:signal_main/home/home_screen.dart';
import 'package:signal_main/login/onboarding_screen.dart';
import 'package:signal_main/login/signin.dart';
import 'package:signal_main/login/splash.dart';

//import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Signal UI',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.grey,
        //canvasColor: Colors.grey,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}
