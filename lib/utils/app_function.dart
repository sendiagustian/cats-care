import 'dart:io';

import 'package:catscare/screens/home/home_menu.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:catscare/widgets/menu_more.dart';
import 'package:flutter/material.dart';

class AppFunction {
  static void appBarActionMoreMenu(BuildContext context, {int? countOnPop}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MenuMoreScreen(
            countOnPop: countOnPop,
          );
        },
      ),
    );
  }

  static void appBarActionHomeMenu(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const HomeMenuScreen();
        },
      ),
    );
  }

  static void exitApp(BuildContext context) {
    AppWidget.appDialog(
      context: context,
      title: 'Konfirmasi',
      content: 'Apakah kamu yakin mau meninggalkan aku? :(',
      buttonActions: [
        TextButton(
          onPressed: () => exit(0),
          child: const Text(
            'Selamat Tinggal',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Enggak Jadi',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void infoApp(BuildContext context) {
    AppWidget.appDialog(
      context: context,
      title: 'Info Aplikasi',
      contentTextAlign: TextAlign.justify,
      content: '''
          Cats Care adalah aplikasi yang dapat membantu pemelihara kucing yang awam untuk mendapatkan pengetahuan seputar perawatan kucing berdasarkan jenisnya.
          \n
          Anggota Kelompok:
          19552011018 - Sendi Agustian
          19552011069 - Azizah Maulina N.H
          19552011092 - Rizky Syaeful Islami
          19552011099 - Andre Purba
          19552011008 - Andi Pramana
        ''',
      buttonActions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Ok Mantap!',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
