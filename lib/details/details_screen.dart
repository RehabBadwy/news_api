import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details';

  @override
  Widget build(BuildContext context) {
   var args = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details'
        ),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: args.urlToImage??"",
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
                child: Image.network(args.urlToImage??"",
                  height: 180,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 8,
            ),
            Text(args.author??"",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500
              ),
              textAlign: TextAlign.start,
            ),
            Text(args.title?? "",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade900
                ),
                textAlign: TextAlign.start
            ),
            Text(args.publishedAt?? "",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              child: Text(args.content??"",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400
              ),
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05,),
            IconButton(onPressed: (){
              launchURL(args.url??"");
            }, icon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('View Watched'),
                Icon(Icons.arrow_right)
              ],
            ))
          ],
        ),
      )
    );
  }
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
