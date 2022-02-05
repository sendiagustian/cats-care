import 'package:catscare/models/type_cat_model.dart';
import 'package:catscare/utils/app_function.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailTypeCatScreen extends StatelessWidget {
  final TypeCatModel typeCatModel;
  const DetailTypeCatScreen(this.typeCatModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(
        isHomeMenu: false,
        onPressed: () => AppFunction.appBarActionMoreMenu(
          context,
          countOnPop: 3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                typeCatModel.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                typeCatModel.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Html(
                data: typeCatModel.content,
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
