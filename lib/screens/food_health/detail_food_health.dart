import 'package:catscare/models/food_health_model.dart';

import 'package:catscare/widgets/app_widget.dart';
import 'package:catscare/widgets/menu_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailFoodHealthScreen extends StatelessWidget {
  final FoodHealthModel foodHealthModel;
  const DetailFoodHealthScreen(this.foodHealthModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(
        isHomeMenu: false,
        onPressed: () {
          Navigator.of(context)
            ..pop()
            ..push(
              MaterialPageRoute(
                builder: (context) {
                  return const MenuMoreScreen();
                },
              ),
            );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                foodHealthModel.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                foodHealthModel.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Html(
                data: foodHealthModel.content,
                style: {
                  'p': Style(
                    padding: EdgeInsets.zero,
                    textAlign: TextAlign.justify,
                    fontFamily: 'Alice',
                  ),
                  'h3': Style(
                    padding: EdgeInsets.zero,
                    fontFamily: 'Alice',
                  )
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
