import 'package:catscare/utils/app_style.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:catscare/widgets/menu_more.dart';
import 'package:flutter/material.dart';

class TypeCatScreen extends StatelessWidget {
  const TypeCatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(
        isHomeMenu: false,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const MenuMoreScreen();
              },
            ),
          );
        },
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 38.0),
        itemCount: 4,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Material(
              color: AppStyle.styleColor.accentColor,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
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
          );
        },
      ),
    );
  }
}
