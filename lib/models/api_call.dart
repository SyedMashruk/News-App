import 'dart:convert';

import 'package:news/models/news_model.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  final everythingUrl =
      'https://newsapi.org/v2/everything?q=worldwide&apiKey=d5a2244281aa40e99d16b05836b498cf';
  final topHeadlineUrl =
      'https://newsapi.org/v2/everything?q=sports&apiKey=d5a2244281aa40e99d16b05836b498cf';

  Future<List<NewsModel>> allNews() async {
    try {
      var allData = await http.get(Uri.parse(everythingUrl));
      if (allData.statusCode == 200) {
        Map<String, dynamic> allNewsData = jsonDecode(allData.body);
        List<dynamic> newsList = allNewsData['articles'];
        List<NewsModel> everthingNews =
            newsList.map((news) => NewsModel.fromJson(news)).toList();
        return everthingNews;
      } else {
        throw ('Error');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NewsModel>> topNews() async {
    try {
      var allData = await http.get(Uri.parse(topHeadlineUrl));
      if (allData.statusCode == 200) {
        Map<String, dynamic> allNewsData = jsonDecode(allData.body);
        List<dynamic> newsList = allNewsData['articles'];
        List<NewsModel> topNews =
            newsList.map((news) => NewsModel.fromJson(news)).toList();
        return topNews;
      } else {
        throw ('Error');
      }
    } catch (e) {
      rethrow;
    }
  }
}
