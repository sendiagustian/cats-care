import 'package:catscare/screens/food_health/backend_manage/backend_manage.dart';
import 'package:catscare/screens/type_cat/backend_manage/backend_manage.dart';
import 'package:catscare/utils/app_function.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({Key? key}) : super(key: key);

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
            iconData: Icons.settings,
            title: 'MANAGE TYPE OF CATS',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const BackendManageTypeCatScreen();
                  },
                ),
              );
            },
          ),
          _buildItemMenu(
            context,
            iconData: Icons.settings,
            title: 'MANAGE FOOD & HEALTH',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const BackendManageFoodHealthScreen();
                  },
                ),
              );
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
          ),
        ],
      ),
    );
  }
}
