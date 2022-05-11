import 'package:news_app/data/SourcesRespone.dart';

/// status : "ok"
/// totalResults : 10
/// articles : [{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"California grocery workers vote to authorize strike","description":"","url":"https://abcnews.go.com/US/wireStory/california-grocery-workers-vote-authorize-strike-83701286","urlToImage":"https://s.abcnews.com/images/Business/WireAP_ee9f79a10bd34fd78f6933a2399c0a43_16x9_992.jpg","publishedAt":"2022-03-27T17:31:47Z","content":"LOS ANGELES -- Thousands of central and Southern California grocery workers have voted to authorize their union to call a strike against several major supermarket chains as contract negotiations are … [+2803 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Online video shows girl fatally shooting cousin and herself","description":"","url":"https://abcnews.go.com/US/wireStory/online-video-shows-girl-fatally-shooting-cousin-83701469","urlToImage":"null","publishedAt":"2022-03-27T17:23:00Z","content":"ST. LOUIS -- Two young cousins were livestreaming from a St. Louis apartment when one child fatally shot the other before killing herself in what family members say was a tragic accident.\r\nPolice are… [+1648 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Officials lift most evacuation orders on Colorado wildfire","description":"","url":"https://abcnews.go.com/US/wireStory/officials-lift-evacuation-orders-colorado-wildfire-83701126","urlToImage":"null","publishedAt":"2022-03-27T17:05:00Z","content":"BOULDER, Colo. -- A wildfire south of Boulder that forced nearly 20,000 people to flee was listed at 21% contained and most evacuations had been lifted by Sunday morning, officials with Boulder Fire-… [+1908 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Country music singer Jeff Carson dies in Tennessee","description":"","url":"https://abcnews.go.com/Entertainment/wireStory/country-music-singer-jeff-carson-dies-tennessee-83700991","urlToImage":"https://s.abcnews.com/images/Entertainment/WireAP_b8c4b0463c824699bc2ec1f801a8d565_16x9_992.jpg","publishedAt":"2022-03-27T16:38:00Z","content":"NASHVILLE, Tenn. -- Country music singer and songwriter Jeff Carson, who scored hits with Not On Your Love, and The Car before becoming a police officer, has died in Tennessee, his publicist said. Ca… [+1615 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Nevada casino to pay $8M for serving chemicals, not beer","description":"","url":"https://abcnews.go.com/Health/wireStory/nevada-casino-pay-8m-serving-chemicals-beer-83701124","urlToImage":"null","publishedAt":"2022-03-27T16:14:00Z","content":"LAS VEGAS -- A jury in Las Vegas has awarded $8 million to a middle school special education teacher who sued after being permanently injured when he was served cleaning solvents instead of tap beer … [+1111 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"RICARDO ALONSO-ZALDIVAR Associated Press","title":"US-backed group gets lifesaving meds to Ukrainians amid war","description":"","url":"https://abcnews.go.com/Health/wireStory/us-backed-group-lifesaving-meds-ukrainians-amid-war-83699406","urlToImage":"https://s.abcnews.com/images/Health/WireAP_a39f235ae65a402b95b7f8be695064a0_16x9_992.jpg","publishedAt":"2022-03-27T12:37:46Z","content":"WASHINGTON -- Thousands of patients in Ukraine are receiving lifesaving medicines to treat HIV and opioid addiction through a U.S.-funded group still operating despite the Russian invasion. Supplies … [+5726 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"WILL WEISSERT and JEFF AMY Associated Press","title":"Trump returns to Georgia confronting test of his grip on GOP","description":"","url":"https://abcnews.go.com/Politics/wireStory/trump-returns-georgia-confronting-test-grip-gop-83699372","urlToImage":"https://s.abcnews.com/images/WNT/220309_wn_2ndblk_trump_hpMain_16x9_992.jpg","publishedAt":"2022-03-27T12:19:00Z","content":"COMMERCE, Ga. -- In Donald Trump's push to fundamentally reshape the Republican Party, few places are a higher priority than Georgia.\r\nThe former president has issued highly-coveted endorsements in r… [+7607 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"Mark Osborne","title":"2nd black box found as investigators search for answers in China plane crash","description":"","url":"https://abcnews.go.com/International/2nd-black-box-found-investigators-search-answers-china/story?id=83697219","urlToImage":"https://s.abcnews.com/images/International/china-black-box_hpMain_20220326-233734_16x9_992.jpg","publishedAt":"2022-03-27T04:06:00Z","content":"The second black box from China Eastern Airlines Flight 5735 was found Sunday as investigators try to piece together what caused the passenger plane to plunge straight into the ground, killing all 13… [+2165 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Boston parking garage being demolished collapses; 1 killed","description":"","url":"https://abcnews.go.com/US/wireStory/boston-parking-garage-construction-partially-collapses-83693894","urlToImage":"https://s.abcnews.com/images/US/boston-garage-collapse-ugc-mo-20220326_1648350454141_hpMain_16x9_992.jpg","publishedAt":"2022-03-27T02:19:00Z","content":"BOSTON -- A portion of a downtown Boston parking garage that was being demolished collapsed Saturday evening, killing a construction worker, officials said.\r\nBoston Emergency Medical Services confirm… [+1469 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"GRANT SCHULTE Associated Press","title":"US Rep. Jeff Fortenberry of Nebraska announces resignation","description":"","url":"https://abcnews.go.com/Politics/wireStory/us-rep-jeff-fortenberry-nebraska-announces-resignation-83693091","urlToImage":"null","publishedAt":"2022-03-26T23:31:32Z","content":"OMAHA, Neb. -- Republican U.S. Rep. Jeff Fortenberry of Nebraska on Saturday resigned from office after a California jury convicted him of lying to federal authorities about an illegal campaign donat… [+3446 chars]"}]

class NewsResponse {
  NewsResponse({
      this.status, 
      this.totalResults,
    this.message,
    this.code,
      this.articles,});

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<News>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "The Associated Press"
/// title : "California grocery workers vote to authorize strike"
/// description : ""
/// url : "https://abcnews.go.com/US/wireStory/california-grocery-workers-vote-authorize-strike-83701286"
/// urlToImage : "https://s.abcnews.com/images/Business/WireAP_ee9f79a10bd34fd78f6933a2399c0a43_16x9_992.jpg"
/// publishedAt : "2022-03-27T17:31:47Z"
/// content : "LOS ANGELES -- Thousands of central and Southern California grocery workers have voted to authorize their union to call a strike against several major supermarket chains as contract negotiations are … [+2803 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}
