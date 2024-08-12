import 'package:flutter/material.dart';
import 'package:news/viewmodel/news_article_list_view_model.dart';
import 'package:news/widgets/custom_customscrollview_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsView extends ConsumerStatefulWidget {
  const NewsView({super.key});

  @override
  NewsViewState createState() => NewsViewState();
}

class NewsViewState extends ConsumerState<NewsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(newsArticleListViewModelProvider.notifier).topHeadlines();
    });
  }

  @override
  Widget build(BuildContext context) {
    final listviewModel = ref.watch(newsArticleListViewModelProvider.notifier);

    return Scaffold(
      body: CustomCostomScrollViewWidget(listviewModel: listviewModel),
    );
  }
}
