import 'package:flutter/material.dart';
import 'package:news_app/data/category.dart';

class CategoryItem extends StatelessWidget {

  Category category;
  int index;
  CategoryItem(this.category,this.index,this.onCategoryClick);
  Function onCategoryClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryClick(category);
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(index%2==0?24:0),
            bottomRight: Radius.circular(index%2==0?0:24),
          )
        ),
        child: Column(
          children: [
           Row(
             children: [
               SizedBox(
                 width: 12,
               ),
               Expanded(
                 child: Image.asset(category.image,
                   fit: BoxFit.fill,
                   height: 100,
                 ),
               ),
               SizedBox(
                 width: 12,
               ),
             ],
           ),
            SizedBox(
              height: 12,
            ),
            Text(category.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
            )
          ],
        ),
      ),
    );
  }
}
