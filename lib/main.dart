import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp/home.dart';
import 'package:otp/phone.dart';

import 'otp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: 'phone',
     routes: {
      'phone': (context)=>MyPhone(),
      'otp':(context)=>MyOtp(),
      // 'home':(context) => HomePage()
     }

    );
  }
}