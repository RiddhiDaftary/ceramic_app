import 'dart:convert';

import 'package:ceramic_app/model/category.dart';
import 'package:ceramic_app/model/product.dart';
import 'package:ceramic_app/model/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String urlAllCategories = 'http://esptiles.imperoserver.in/api/API/Product/DashBoard';
const String urlProduct = 'http://esptiles.imperoserver.in/api/API/Product/ProductList';

class NetworkManager{

  static Future<List<Category>> getCategoryData(BuildContext context, String url) async {

    http.Response response = await http.post(url,
      body: {
        "CategoryId":"0",
        "DeviceManufacturer":"Google",
        "DeviceModel":"Android SDK built for x86",
        "DeviceToken":" ",
        "PageIndex":"1"
      }
    );

    if(response.statusCode == 200){
      print(response.request.url);
      String data = response.body;
      print(data);
      return parseCategoryListData(context, jsonDecode(data));

    }else{
      print('Something wrong with api code: ${response.statusCode}');
      return null;
    }

  }

  static List<Category> parseCategoryListData(BuildContext context, dynamic categoriesData) {
    print(categoriesData);
    dynamic dynamicCategoryList = categoriesData['Result']['Category'];

    List<Category> categoryList = List();
    for (int i = 0; i < dynamicCategoryList.length; i++) {

      print(i);
      Category category = Category();
      category.name = categoriesData['Result']['Category'][i]['Name'];
      print(category.name);

      category.id = categoriesData['Result']['Category'][i]['Id'];
      print(category.id);

      categoryList.add(category);
    }

    return categoryList;
  }


  static Future<List<SubCategory>> getSubCategoryData(BuildContext context, String url) async {

    http.Response response = await http.post(url,
        body: {
          "CategoryId":"56",
          "PageIndex":"2"
        }
    );

    if(response.statusCode == 200){
      print(response.request.url);
      String data = response.body;
      print(data);
      return parseSubCategoryListData(context, jsonDecode(data));

    }else{
      print('Something wrong with api code: ${response.statusCode}');
      return null;
    }

  }

  static List<SubCategory> parseSubCategoryListData(
      BuildContext context, dynamic subCategoriesData) {
    print(subCategoriesData);
    dynamic dynamicSubCategoryList = subCategoriesData['Result']['Category'][0]['SubCategories'];

    List<SubCategory> subCategoryList = List();
    for (int i = 0; i < dynamicSubCategoryList.length; i++) {
      print(i);
      SubCategory subCategory = SubCategory();
      subCategory.name =
      subCategoriesData['Result']['Category'][0]['SubCategories'][i]['Name'];
      print(subCategory.name);

      subCategory.id =
      subCategoriesData['Result']['Category'][0]['SubCategories'][i]['Id'];
      print(subCategory.id);

      subCategoryList.add(subCategory);
    }

    return subCategoryList;
  }

  static Future<List<Product>> getProductData(BuildContext context, String url,
      int subCategoryId) async {

    http.Response response = await http.post(url,
        body: {
          "SubCategoryId":"$subCategoryId",
          "PageIndex":"2"
        }
    );

    if(response.statusCode == 200){
      print(response.request.url);
      String data = response.body;
      print(data);
      return parseProductListData(context, jsonDecode(data));

    }else{
      print('Something wrong with api code: ${response.statusCode}');
      return null;
    }

  }

  static List<Product> parseProductListData(
      BuildContext context, dynamic productData) {
    print(productData);
    dynamic dynamicSubCategoryList = productData['Result'];

    List<Product> productList = List();
    for (int i = 0; i < dynamicSubCategoryList.length; i++) {
      print(i);
      Product product = Product();
      product.name = productData['Result'][i]['Name'];
      print(product.name);

      product.id = productData['Result'][i]['Id'];
      print(product.id);

      product.image = productData['Result'][i]['ImageName'];
      print(product.name);

      product.priceCode = productData['Result'][i]['PriceCode'];
      print(product.id);

      productList.add(product);
    }

    return productList;
  }

}