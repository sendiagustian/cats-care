import 'package:catscare/databases/food_health_database.dart';
import 'package:catscare/models/food_health_model.dart';
import 'package:catscare/utils/app_function.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/utils/html_extension.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BackendManageFoodHealthScreen extends StatefulWidget {
  const BackendManageFoodHealthScreen({Key? key}) : super(key: key);

  @override
  _BackendManageFoodHealthScreenState createState() =>
      _BackendManageFoodHealthScreenState();
}

class _BackendManageFoodHealthScreenState
    extends State<BackendManageFoodHealthScreen> {
  Widget _buildItemList(BuildContext context, FoodHealthModel foodHealthModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Material(
        color: AppStyle.styleColor.accentColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
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
                        "assets/images/food.png",
                      ),
                      image: NetworkImage(
                        foodHealthModel.cover.toString(),
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
                        foodHealthModel.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        Html2StringExtension.renderToSring(
                            foodHealthModel.content),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Alice',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              elevation: 0,
                              // backgroundColor: Colors.black,
                              primary: Colors.black,
                            ),
                            onPressed: () {},
                            child: const Text(
                              'EDIT',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.red,
                              primary: Colors.black,
                            ),
                            onPressed: () {},
                            child: const Text(
                              'DELETE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
      body: StreamBuilder<QuerySnapshot<FoodHealthModel>>(
        stream: FoodHealthDatabase().streamFoodHealths(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<FoodHealthModel>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 38.0,
                    vertical: 60,
                  ),
                  child: Column(
                    children:
                        List.generate(snapshot.data!.docs.length, (index) {
                      final FoodHealthModel foodHealthModel =
                          snapshot.data!.docs[index].data();
                      return _buildItemList(
                        context,
                        foodHealthModel,
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: AppStyle.styleColor.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
