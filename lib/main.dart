import 'package:catscare/utils/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cats Care',
      theme: ThemeData(
        primarySwatch: AppStyle.styleColor.primarySwatchColor,
        fontFamily: 'FredokaOne',
      ),
      home: Scaffold(
        body: Center(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('test')
                .doc('QpTeTIDE9rYVLEUlM2iB')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.get('test'));
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
