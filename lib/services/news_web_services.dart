// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:news/models/news_article_model.dart';
import 'package:news/src/constants.dart';

class NewsWebServices {
  var dio = Dio();

  Future<List<NewsArticleModel>> fetchToHeadlines() async {

    String url = Url.topHeadline();
    String urlbbc = Url.toHeadlinesSourceBBCNews();
    print('Request URL👀: $url');
    print("🍿$urlbbc");


    try {

      final response = await dio.get(url);
      print('Status Code👀👀: ${response.statusCode}');
      print('Response Data👀👀: ${response.data}');


      final responseBBC = await dio.get(urlbbc);
      print("🍿🍿${responseBBC.statusCode}");
      print("🍿🍿${responseBBC.data}");


      if (response.statusCode == 200 && responseBBC.statusCode == 200) {
        final result1 = response.data;
        print('result1👀👀👀: $result1');
        Iterable newsList1 = result1['articles'];
        print('newsList1👀👀👀$newsList1');


        final result2 = responseBBC.data;
        print('🍿🍿🍿$result2');
        Iterable newsList2 = result2['articles'];
        print('🍿🍿🍿$newsList2');

        List<NewsArticleModel> combinedNewsList = [
          ...newsList2.map((artcle) => NewsArticleModel.fromJson(artcle)),
          ...newsList1.map((article) => NewsArticleModel.fromJson(article))
        ];

        print('🍿👀$combinedNewsList');
        return combinedNewsList;

        
      } else {
        throw Exception('Failed to get top US news');
      }
    } catch (e) {
      if (e is DioException) {
        print('DioError: ${e.message}');
        if (e.response != null) {
          print('DioError Response: ${e.response?.data}');
          print('DioError Status Code: ${e.response?.statusCode}');
        }
      } else {
        print('Error: $e');
      }
      throw Exception('Failed to fetch data');
    }
  }
}
