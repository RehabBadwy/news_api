import 'package:flutter/material.dart';
import 'package:news_app/home/categories/category_item.dart';

import '../../data/category.dart';

class CategoryFragment extends StatelessWidget {

  Function onCategoryClickHomeCallBack;
  CategoryFragment(this.onCategoryClickHomeCallBack);
  List<Category>categories = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text("Pick Your category of interest"),
          Expanded(
              child: GridView.builder(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: .9
              ),
                itemBuilder: (_,index){
                return CategoryItem(categories[index],index,onCategoryClick);
                },itemCount: categories.length,
                ),)
        ],
      ),
    );
  }
  void onCategoryClick(Category category){
    onCategoryClickHomeCallBack(category);
  }
}
