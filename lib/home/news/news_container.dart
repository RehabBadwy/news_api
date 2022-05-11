import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/data/NewsResponse.dart';
import 'package:news_app/home/news/news_widget.dart';

class NewsContainer extends StatefulWidget {

  String sourceId;
  NewsContainer(this.sourceId);


  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  late ScrollController scrollController;
  bool showLoading = false;
  int page =1;
  List<News> news =[];
 @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          showLoading = true;
          setState(() {

          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {

   if(showLoading == true){
     ApiManger.getNews(sourceId: widget.sourceId,page: ++page)
         .then((newsResponse){
        setState(() {
          if(newsResponse!=null){
            news.addAll(newsResponse.articles!.toList());
          }
        });
     });
   }

    return FutureBuilder<NewsResponse>(
       future: ApiManger.getNews(sourceId: widget.sourceId),
        builder: (_,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasData){
            var data = snapshot.data;
            if(data?.status == 'ok'){

              return ListView.builder(
                controller: scrollController,
                  itemBuilder: (_,index){
                    return NewsWidget((data?.articles?.elementAt(index))!);
                  },itemCount: (data?.articles?.length)
                  );
            } else {
              return Center(child: Text(data?.message?? ""));
            }
          }return Center(child: Text(snapshot.error.toString()));
        }
    );
  }
}
