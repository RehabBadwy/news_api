import 'package:flutter/material.dart';
import 'package:news_app/data/SourcesRespone.dart';
import 'package:news_app/home/news/news_container.dart';
import 'package:news_app/home/category_details/tab_item.dart';

class TabsContainer extends StatefulWidget {

  List<Source?> soursesList;
  TabsContainer(this.soursesList);

  @override
  State<TabsContainer> createState() => _TabsContainerState();
}

class _TabsContainerState extends State<TabsContainer> {
  int selectedSource=0;

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
      length: widget.soursesList.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs:
              widget.soursesList.map((source) => TabItem(
                source!,
                widget.soursesList.indexOf(source) == selectedSource
              ))
                .toList(),
            onTap: (index){
              selectedSource = index;
              setState(() {

              });
            },
          ),
          Expanded(
              child:
              NewsContainer(widget.soursesList.elementAt(selectedSource)?.id??"")),
        ],
      ),
    );
  }
}
