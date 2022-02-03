import 'package:catscare/databases/type_cat_database.dart';
import 'package:catscare/models/type_cat_model.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:catscare/widgets/menu_more.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TypeCatScreen extends StatelessWidget {
  const TypeCatScreen({Key? key}) : super(key: key);

  Widget _buildItemList(BuildContext context, TypeCatModel typeCatModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          color: AppStyle.styleColor.accentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage(
                    "assets/images/cat.png",
                  ),
                  image: NetworkImage(
                    typeCatModel.cover.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    typeCatModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    typeCatModel.content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Alice',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.black,
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'MORE INFO',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 60),
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(10),
    //     onTap: () {},
    //     child: Container(
    //       padding: const EdgeInsets.only(left: 5),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 Text(
    //                   typeCatModel.title,
    //                   maxLines: 3,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.grey[700],
    //                   ),
    //                 ),
    //                 const SizedBox(height: 5),
    //                 Text(
    //                   'DateTimeUtils.dateFormat(newsModel.createdAt)',
    //                   maxLines: 1,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: TextStyle(
    //                     fontFamily: 'Lato',
    //                     fontSize: 10,
    //                     color: Colors.grey[700],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(width: 6),
    //           SizedBox(
    //             height: 90,
    //             width: 88,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(10),
    //               child: FadeInImage(
    //                 placeholder: const AssetImage(
    //                   "assets/images/cat.png",
    //                 ),
    //                 image: NetworkImage(
    //                   typeCatModel.cover.toString(),
    //                 ),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

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
      body: StreamBuilder<QuerySnapshot<TypeCatModel>>(
        stream: TypeCatDatabase().streamTypeCats(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<TypeCatModel>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 60.0,
              horizontal: 38.0,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              TypeCatModel typeCatModel = snapshot.data!.docs[index].data();
              return _buildItemList(context, typeCatModel);
            },
          );
        },
      ),
    );
  }
}
