import 'package:catscare/utils/app_function.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class MenuMoreScreen extends StatelessWidget {
  final int? countOnPop;
  const MenuMoreScreen({
    Key? key,
    this.countOnPop,
  }) : super(key: key);

  Widget _buildItemMenu(
    BuildContext context, {
    required IconData iconData,
    required String title,
    required Function() onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.styleColor.accentColor,
        border: const Border(
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: Colors.black,
          size: 50,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(),
      body: ListView(
        children: [
          _buildItemMenu(
            context,
            iconData: Icons.home,
            title: 'HOME',
            onTap: () {
              if (countOnPop != null) {
                for (var i = 0; i < countOnPop!; i++) {
                  Navigator.of(context).pop();
                }
              }
              Navigator.of(context).pushReplacementNamed('home');
            },
          ),
          _buildItemMenu(
            context,
            iconData: Icons.info,
            title: 'INFO',
            onTap: () => AppFunction.infoApp(context),
          ),
          _buildItemMenu(
            context,
            iconData: Icons.logout,
            title: 'EXIT',
            onTap: () => AppFunction.exitApp(context),
          )
        ],
      ),
    );
  }
}
