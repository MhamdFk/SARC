import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:modern/auth/auth.dart';
import 'package:modern/pages/history.dart';
import 'package:modern/pages/homepage.dart';
import 'package:modern/components/maps.dart';
import 'package:modern/pages/login.dart';
import 'package:modern/pages/profile.dart';
import 'package:modern/pages/signup.dart';
import 'package:modern/pages/users.dart';
import 'package:modern/pages/welcome_screen.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessaginBackgroundHandler);
  runApp(const MyApp());
  usePathUrlStrategy();
}
@pragma('vm:entry-point')
Future<void> _firebaseMessaginBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
  print(message.notification!.body.toString());
  print(message.data.toString());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      Firebase.initializeApp();
    }

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        "/SignUp": (context) => const SignUp(),
        "/login": (context) => login(),
        "/maps": (context) => const MapsFlutter(),
        "/welcomescreen": (context) => const Welcomescreen(),
        "/MyCheckBox": (context) => const MyCheckBox(),
        "/ProfilePage": (context) => ProfilePage(),
        "/UserPage": (context) => UserPage(),
        "/HistoryPage": (context) => HistoryPage(),
        // "not_screen":(context) => MessageScreen(body: "${Body}",title:"${Title}" ,)
      },
    );
  }
}
