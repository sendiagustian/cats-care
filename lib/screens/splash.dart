import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration _loading = const Duration(seconds: 3);

  void navigatedToHome() {
    Future.delayed(_loading, () {
      Navigator.of(context).pushReplacementNamed('home');
    });
  }

  @override
  void initState() {
    navigatedToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/apps/icon_app_transparant.png',
              width: 200,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
