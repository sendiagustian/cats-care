import 'package:flutter/material.dart';

class AppWidget {
  static AppBar appBar({
    bool? isHomeMenu,
    Function()? onPressed,
  }) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        'assets/images/paw.png',
        height: 220,
      ),
      actions: isHomeMenu != null
          ? [
              IconButton(
                onPressed: onPressed,
                icon: isHomeMenu
                    ? const Icon(
                        Icons.list,
                        size: 30,
                      )
                    : const Icon(
                        Icons.more_vert,
                        size: 30,
                      ),
              )
            ]
          : null,
    );
  }
}
