import 'package:catscare/screens/home/home.dart';
import 'package:catscare/screens/splash.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cats care',
      theme: ThemeData(
        primarySwatch: AppStyle.styleColor.primarySwatchColor,
        fontFamily: 'FredokaOne',
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const HomeScreen(),
      },
    );
  }
}
