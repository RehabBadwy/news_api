import 'package:flutter/material.dart';
import 'package:news_app/data/NewsResponse.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/categories/category_fragment.dart';
import 'package:news_app/home/home_side_menu.dart';
import 'package:news_app/home/news/news_widget.dart';

import '../api_manger.dart';
import '../data/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              Text(
                  "News App"
              ),
              IconButton(onPressed: (){
                showSearch(context: context, delegate: NewSearch());
              }, icon: Icon(Icons.search))
            ],
          )
        ),
        drawer: Drawer(
          child: HomeSideMenu(onCategoryClick),
        ),
        body:  selectedCategory==null ?
        CategoryFragment(onCategoryClick):
        CategoryDetails(selectedCategory!),
      ),
    );
  }

  Category? selectedCategory=null;

  void onCategoryClick(Category category){
    selectedCategory=category;
    setState(() {

    });
  }

  void onSideMenuItem(String item){
    Navigator.pop(context);
    if(item==HomeSideMenu.settings){

    }else if(item==HomeSideMenu.category){
      selectedCategory==null;
      setState(() {

      });
    }
  }
}

class NewSearch extends SearchDelegate{

  late Future<NewsResponse> newsResponse;
  NewSearch(){
    newsResponse = ApiManger.getNews(searchKeyWord: query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: (){
       newsResponse = ApiManger.getNews(searchKeyWord: query);
       showResults(context);
     }, icon: Icon(Icons.search,color: Colors.black,))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.clear,color: Colors.black,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<NewsResponse>(
          future: newsResponse,
          builder: (_,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasData){
              var data = snapshot.data;
              if(data?.status == 'ok'){
                return ListView.builder(
                    itemBuilder: (_,index){
                      return NewsWidget((data?.articles?.elementAt(index))!);
                    },itemCount: (data?.articles?.length)
                );
              } else {
                return Center(child: Text(data?.message?? ""));
              }
            }return Center(child: Text(snapshot.error.toString()));
          }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return Container(
       color: Colors.white,
       width: double.infinity,
       height: double.infinity,
       child: Text("Suggestions"),
     );
  }

}
