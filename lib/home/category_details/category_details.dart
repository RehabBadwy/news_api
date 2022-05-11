import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/data/SourcesRespone.dart';
import 'package:news_app/data/category.dart';
import 'package:news_app/home/category_details/tabs_container.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName='category';
  Category category;
  CategoryDetails(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: FutureBuilder<SourcesResponse>(
        future: ApiManger.getNewsSources(category.id),
        builder: (_,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasData){
            var data = snapshot.data;
            if(data?.status == 'ok'){
              return TabsContainer(data!.sources!);
            } else {
              return Center(child: Text(data?.message?? ""));
            }
          }return Center(child: Text(snapshot.error.toString()));
        },
      ),
    );
  }
}
