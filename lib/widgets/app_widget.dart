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

  static Future<dynamic> appDialog({
    required BuildContext context,
    required String title,
    required String content,
    required List<Widget> buttonActions,
    Widget? image,
    TextAlign? contentTextAlign,
    bool isDismissible = true,
  }) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      transitionDuration: const Duration(milliseconds: 150),
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    image ?? Container(),
                    Text(
                      content,
                      textAlign: contentTextAlign,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Alice',
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                actions: buttonActions,
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget formTextField({
    String? labelText,
    String? errorText,
    TextEditingController? controller,
    TextInputType? textInputType,
    FocusNode? focusNode,
    Widget? rightWidget,
    Widget? leftWidget,
    String? hintText,
    int? maxLines,
    int? maxLength,
    Decoration? boxDecoration,
    double? height,
    String? Function(String?)? validator,
    Function()? onTap,
    Function()? onEditingComplete,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      style: const TextStyle(
          fontSize: 14.0, color: Colors.black, fontFamily: 'Alice'),
      keyboardType: textInputType,
      focusNode: focusNode,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        counterText: '',
        contentPadding: const EdgeInsets.all(10.0),
        suffixIcon: rightWidget,
        prefixIcon: leftWidget,
        hintStyle: const TextStyle(fontSize: 14.0, fontFamily: 'Alice'),
        border: UnderlineInputBorder(
          borderSide: const BorderSide(
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
