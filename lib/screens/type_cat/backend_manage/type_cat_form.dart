import 'dart:io';

import 'package:catscare/utils/app_function.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/utils/image_picker_utils.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class TypeCatFormScreen extends StatefulWidget {
  const TypeCatFormScreen({Key? key}) : super(key: key);

  @override
  _TypeCatFormScreen createState() => _TypeCatFormScreen();
}

class _TypeCatFormScreen extends State<TypeCatFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(
        isHomeMenu: false,
        onPressed: () => AppFunction.appBarActionMoreMenu(
          context,
          countOnPop: 4,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: AppStyle.styleColor.primaryColor,
              child: _imageFile != null
                  ? Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Text('Gambar Cover'),
                    ),
            ),
            ElevatedButton(
              onPressed: () async {
                File _image = await PickImage().getImageGallery();
                setState(() {
                  _imageFile = _image;
                });
              },
              child: const Text(
                'Upload Gambar',
              ),
            ),
            const SizedBox(height: 8.0),
            AppWidget.formTextField(
              onChanged: (text) {},
              // controller: formProvider.titleControl,
              validator: (String? text) {
                // return formProvider.notEmpty(text);
              },
              labelText: 'Judul',
              hintText: 'mis. Kucing Kampung',
            ),
            const SizedBox(height: 8.0),
            AppWidget.formTextField(
              onChanged: (text) {},
              // controller: formProvider.titleControl,
              validator: (String? text) {
                // return formProvider.notEmpty(text);
              },
              maxLines: 15,
              labelText: 'Konten',
              hintText: '''Recomended copy & paste in web
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
              ''',
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Simpan',
              ),
            ),
            const SizedBox(height: 300.0),
          ],
        ),
      ),
    );
  }
}
