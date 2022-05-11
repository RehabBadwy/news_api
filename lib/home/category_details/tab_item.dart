import 'package:flutter/material.dart';
import 'package:news_app/data/SourcesRespone.dart';


class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem(this.source,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected?Colors.green:Colors.transparent,
        border:Border.all(color: Colors.green,
        width: 2,
        ),
        borderRadius: BorderRadius.circular(18)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
        child: Text(source.name??"",
        style: TextStyle(
          color: isSelected?Colors.white:Colors.green
        ),
        ),
      ),
    );
  }
}
