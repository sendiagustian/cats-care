import 'package:catscare/screens/food_health/food_health.dart';
import 'package:catscare/screens/type_cat/type_cat.dart';
import 'package:catscare/utils/app_function.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required String pathImg,
    required Function() onTap,
  }) {
    return Column(
      children: [
        const SizedBox(height: 60.0),
        Material(
          color: AppStyle.styleColor.accentColor,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 8.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    pathImg,
                    height: 110,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(
        isHomeMenu: true,
        onPressed: () => AppFunction.appBarActionHomeMenu(context),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(38, 0, 38, 60),
        children: [
          _buildMenuItem(
            context,
            title: 'TIPE OF CATS',
            pathImg: 'assets/images/cat.png',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const TypeCatScreen();
                  },
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            title: 'FOOD & HEALTH',
            pathImg: 'assets/images/food.png',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const FoodHealthScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: const SizedBox(
        height: 60,
        child: Center(child: Text('2022 © Kelompok 3')),
      ),
    );
  }
}
