import 'package:news/models/news_article_model.dart';
import 'package:news/services/news_web_services.dart';
import 'package:news/viewmodel/news_article_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoadingState {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel extends Notifier<LoadingState> {
  NewsArticleListViewModel() : super();

  List<NewsArticleViewModel> articles = [];

  @override
  LoadingState build() {
    return LoadingState.empty;
  }

  Future<void> topHeadlines() async {
    state = LoadingState.searching;
    List<NewsArticleModel> newsArticleModel =
        await NewsWebServices().fetchToHeadlines();

    articles = newsArticleModel
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    state = articles.isEmpty ? LoadingState.empty : LoadingState.completed;
  }
}

final newsArticleListViewModelProvider =
    NotifierProvider<NewsArticleListViewModel, LoadingState>(
  () => NewsArticleListViewModel(),
);
