import 'package:catscare/utils/app_style.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class MenuMoreScreen extends StatelessWidget {
  const MenuMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: AppStyle.styleColor.accentColor,
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..pop()
                  ..pushReplacementNamed('home');
              },
              leading: const Icon(
                Icons.home,
                color: Colors.black,
                size: 50,
              ),
              title: const Text(
                'HOME',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 1,
            width: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: AppStyle.styleColor.accentColor,
            child: const ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.black,
                size: 50,
              ),
              title: Text(
                'INFO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 1,
            width: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: AppStyle.styleColor.accentColor,
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
                size: 50,
              ),
              title: Text(
                'EXIT',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
