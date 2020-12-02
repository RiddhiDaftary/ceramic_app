import 'package:ceramic_app/model/category.dart';
import 'package:ceramic_app/networking/network_manager.dart';
import 'package:ceramic_app/screens/ceramic_tab.dart';
import 'package:ceramic_app/screens/test_strip_screen.dart';
import 'package:flutter/material.dart';
import 'package:ceramic_app/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Category> categoryList = List();

  @override
  void initState(){
    super.initState();
    loadCategoryTabs();
  }

  Future<List<Category>> loadCategoryTabs() async {
//    List<Category> categoryList =

    List<Category>  categoryList = await NetworkManager.getCategoryData(context, urlAllCategories);
//    Provider.of<CategoryData>(context, listen: false).categoryList = categoryList;

  return categoryList;

  }

  List<Tab> getTabs(){

    List<Tab> tabs = List();
//    for(Category category in Provider.of<CategoryData>(context, listen: false).categoryList){
    for(Category category in categoryList){
      tabs.add(Tab(text: category.name,));
    }

    return tabs;
  }

  List<Widget> getTabBarViews(){

    List<Widget> tabBarViews = List();
//    for(Category category in Provider.of<CategoryData>(context, listen: false).categoryList){
    for(Category category in categoryList){

      if(category.name == 'Ceramic'){
        tabBarViews.add(CeramicTab());
      }else{
        tabBarViews.add(Center(child: Text(category.name)));
      }
    }

    return tabBarViews;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadCategoryTabs(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Center(
              child: Text(
                  'Error in fetching data. Please check your connection.'));
        }

        if (snapshot.data != null) {
          List<Category> categoryList = snapshot.data;
          this.categoryList = categoryList;

          if (categoryList.length > 0) {
            print(categoryList.length);
            print(categoryList[0].name);

            return DefaultTabController(
              length: categoryList.length,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: kPrimaryColor,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () => openTestStrip(),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                  bottom: TabBar(
                    isScrollable: true,
                      tabs: getTabs()
                  ),
                ),
                body: TabBarView(children: getTabBarViews()),
              ),
            );

          } else {
            return Center(child: Text('No Restaurants found'));
          }
        } else {
          return Center(child: Text('Loading...'));
        }

      },
    );
  }

  openTestStrip() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TestStripScreen();
    },));
  }
}