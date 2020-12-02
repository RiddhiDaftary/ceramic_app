import 'package:ceramic_app/components/product_list.dart';
import 'package:ceramic_app/model/sub_category.dart';
import 'package:ceramic_app/networking/network_manager.dart';
import 'package:flutter/material.dart';

class CeramicTab extends StatefulWidget {

  @override
  _CeramicTabState createState() => _CeramicTabState();
}

class _CeramicTabState extends State<CeramicTab> {
  @override
  void initState(){
    super.initState();
    getSubCategories();
  }

  Future<void> getSubCategories() async {
    List<SubCategory>  subCategoryList = await NetworkManager.getSubCategoryData(context, urlAllCategories);
    return subCategoryList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSubCategories(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Center(
              child: Text(
                  'Error in fetching data. Please check your connection.'));
        }
//
        if (snapshot.data != null) {
          List<SubCategory> subcategoryList = snapshot.data;
//          restaurants = subcategoryList;

          if (subcategoryList.length > 0) {
            print(subcategoryList.length);
            print(subcategoryList[0].name);

            return ListView.builder(
              itemCount: subcategoryList.length,
              itemBuilder: (context, index) {
                SubCategory subCategory = subcategoryList[index];
                return SubCategoryItem(subCategory: subCategory);
              },
            );
          } else {
            return Center(child: Text('No sub categories found'));
          }
        } else {
          return Center(child: Text('Loading...'));
        }

      },

    );
  }
}

class SubCategoryItem extends StatelessWidget {
  SubCategoryItem({ @required this.subCategory }) ;

  final SubCategory subCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  subCategory.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              ProductList( subCategoryId: subCategory.id,),
            ],
          ),
        )
    );
  }
}
