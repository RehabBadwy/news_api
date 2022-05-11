import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/NewsResponse.dart';
import 'package:news_app/details/details_screen.dart';

class NewsWidget extends StatelessWidget {

  News news;
  NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName,arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: news.urlToImage??"",
              height: 180,
              imageBuilder: (context, imageProvider) => Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )
                  ),
              ),
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18)
              ),
                child: Image.network(news.urlToImage??"",
                height: 180,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 8,
            ),
            Text(news.author??"",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500
              ),
              textAlign: TextAlign.start,
            ),
            Text(news.title?? "",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade900
                ),
              textAlign: TextAlign.start
            ),
            Text(news.publishedAt?? "",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500
            ),
            ),
          ],
        ),
      ),
    );
  }
}
