import 'package:catscare/screens/food_health/food_health.dart';
import 'package:catscare/screens/home/home_menu.dart';
import 'package:catscare/screens/report/repot.dart';
import 'package:catscare/screens/type_cat/type_cat.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(
        isHomeMenu: true,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const HomeMenuScreen();
              },
            ),
          );
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 38.0),
        children: [
          Material(
            color: AppStyle.styleColor.accentColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const FoodHealthScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 8.0),
                    const Text(
                      'FOOD & HEALTH',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/food.png',
                      height: 110,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 60.0),
          Material(
            color: AppStyle.styleColor.accentColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const TypeCatScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 8.0),
                    const Text(
                      'TIPE OF CATS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/cat.png',
                      height: 110,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 60.0),
          Material(
            color: AppStyle.styleColor.accentColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const RepotScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 8.0),
                    const Text(
                      'REPORTS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/report.png',
                      height: 110,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
