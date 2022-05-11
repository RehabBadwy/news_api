import 'package:flutter/material.dart';

class HomeSideMenu extends StatelessWidget {

  static const String settings ='srtting';
  static const String category ='category';
  Function onItemClick;
  HomeSideMenu(this.onItemClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:64 ),
              child: Text("News App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white
              ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onItemClick(category);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.list),
                  Text("Category")
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onItemClick(settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Text("Settings")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
