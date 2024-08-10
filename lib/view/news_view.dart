// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:news/viewmodel/news_article_list_view_model.dart';
import 'package:news/widgets/custom_customscrollview_widget.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listviewModel = Provider.of<NewsArticleListViewModel>(context);
    print('👇👇👇👇${listviewModel.articles.length}');

    return Scaffold(
      body: CustomCostomScrollViewWidget(listviewModel: listviewModel),
    );
  }
}

