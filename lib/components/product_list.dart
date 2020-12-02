import 'package:ceramic_app/components/product_item.dart';
import 'package:ceramic_app/model/product.dart';
import 'package:ceramic_app/networking/network_manager.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {

  final int subCategoryId;
  ProductList({this.subCategoryId});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState(){
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    List<Product>  productList = await NetworkManager.getProductData(context, urlProduct,71);
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Center(
              child: Text(
                  'Error in fetching data. Please check your connection.'));
        }
//
        if (snapshot.data != null) {
          List<Product> productList = snapshot.data;
//          restaurants = subcategoryList;

          if (productList.length > 0) {
            print(productList.length);
            print(productList[0].name);

            return SizedBox(
              height: 135,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    Product product = productList[index];
                    return ProductItem(product: product);
                  },
                ),
              ),
            );
          } else {
            return Center(child: Text('No Products found'));
          }
        } else {
          return Center(child: Text('Loading...'));
        }
      },
    );
  }
}
