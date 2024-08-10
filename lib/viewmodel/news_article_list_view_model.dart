import 'package:flutter/material.dart';
import 'package:news/models/news_article_model.dart';
import 'package:news/services/news_web_services.dart';
import 'package:news/viewmodel/news_article_view_model.dart';

enum LoadingState {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingState loadingState = LoadingState.empty;

  List<NewsArticleViewModel> articles = [];

  void topHeadlines() async {
    List<NewsArticleModel> newsArticleModel =
        await NewsWebServices().fetchToHeadlines();
    loadingState = LoadingState.searching;
    notifyListeners();

    articles = newsArticleModel
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (articles.isEmpty) {
      loadingState = LoadingState.empty;
    } else {
      loadingState = LoadingState.completed;
    }
    notifyListeners();
  }
}
