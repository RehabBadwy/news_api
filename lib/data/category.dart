import 'package:flutter/cupertino.dart';

class Category{
  String id;
  String image;
  String title;
  Color color;

  Category({required this.id,required this.image,required this.title,required this.color});

  static List<Category> getCategories(){
    return[
      Category(id: 'business', image: 'assets/images/bussines.png', title: 'Business',color: Color(0xFFCF7E48)),
      Category(id: 'entertainment', image: 'assets/images/environment.png', title: 'Entertainment',color: Color(0xFF003E90)),
      Category(id: 'general', image: 'assets/images/Politics.png', title: 'General',color: Color(0xFF4882CF)),
      Category(id: 'health', image: 'assets/images/health.png', title: 'Health',color: Color(0xFFED1E79)),
      Category(id: 'science', image: 'assets/images/science.png', title: 'Science',color: Color(0xFF20352)),
      Category(id: 'sports', image: 'assets/images/ball.png', title: 'Sports',color: Color(0xFFC91C22)),
      Category(id: 'technology', image: 'assets/images/NewsTest.png', title: 'Technology',color: Color(0xFF1CC992)),
    ];
  }
}
