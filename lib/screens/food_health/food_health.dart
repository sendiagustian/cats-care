import 'package:catscare/databases/food_health_database.dart';
import 'package:catscare/models/food_health_model.dart';
import 'package:catscare/screens/food_health/detail_food_health.dart';
import 'package:catscare/utils/app_function.dart';
import 'package:catscare/utils/app_style.dart';
import 'package:catscare/utils/html_extension.dart';
import 'package:catscare/widgets/app_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodHealthScreen extends StatefulWidget {
  const FoodHealthScreen({Key? key}) : super(key: key);

  @override
  State<FoodHealthScreen> createState() => _FoodHealthScreenState();
}

class _FoodHealthScreenState extends State<FoodHealthScreen> {
  final TextEditingController _controller = TextEditingController();
  List<FoodHealthModel> _list = [];
  List<FoodHealthModel> searchResult = [];
  bool _isSearching = false;
  String searchText = "";

  Widget _buildItemList(BuildContext context, FoodHealthModel foodHealthModel) {
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
                    Html2StringExtension.renderToSring(foodHealthModel.content),
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailFoodHealthScreen(foodHealthModel);
                            },
                          ),
                        );
                      },
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
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          searchText = _controller.text;
        });
      }
    });
    _isSearching = false;
    values();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.appBar(
        isHomeMenu: false,
        onPressed: () => AppFunction.appBarActionMoreMenu(
          context,
          countOnPop: 2,
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
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 3,
                      top: 3,
                      bottom: 3,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: _controller,
                        onTap: values,
                        onChanged: searchOperation,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 10, 12, 8),
                          suffixIcon: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Hint here",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'FOOD AND HEALTH',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 38.0,
                  ),
                  child: Column(
                    children: List.generate(
                        _isSearching
                            ? searchResult.length
                            : snapshot.data!.docs.length, (index) {
                      FoodHealthModel foodHealthModel = _isSearching
                          ? searchResult[index]
                          : snapshot.data!.docs[index].data();
                      return _buildItemList(
                        context,
                        foodHealthModel,
                      );
                    }),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void values() async {
    _list = [];
    await FoodHealthDatabase().readFoodHealths().then((docs) {
      if (docs.docs.isNotEmpty) {
        for (var data in docs.docs) {
          _list.add(FoodHealthModel.fromData(data));
        }
      }
    });
  }

  void searchOperation(String searchText) {
    searchResult.clear();
    if (_isSearching) {
      for (int i = 0; i < _list.length; i++) {
        FoodHealthModel data = _list[i];
        if (data.title.toLowerCase().contains(searchText.toLowerCase())) {
          searchResult.add(data);
        }
      }
    }
  }
}
