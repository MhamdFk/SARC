import 'package:flutter/material.dart';
import 'package:modern/components/checkbox_list.dart';
import 'package:modern/components/maps.dart';
import 'package:modern/pages/login.dart';
import 'package:modern/pages/profile.dart';
import 'package:modern/pages/signup.dart';
import 'package:modern/pages/welcome_screen.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  runApp(const MyApp());
  usePathUrlStrategy();
}
const url = 'http://192.168.0.3:3000';
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Welcomescreen(),
      routes: {
        "/SignUp": (context) => const SignUp(),
        "/login": (context) => login(),
        // "/HomePage":(context) => const HomePage(),
        "/maps": (context) => const MapsFlutter(),
        "/welcomescreen": (context) => const Welcomescreen(),
        "/MyCheckBox": (context) => const MyCheckBox(),
        "/ProfilePage": (context) => ProfilePage(),
      },
    );
  }
}
