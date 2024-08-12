import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/viewmodel/news_article_list_view_model.dart';
import 'package:news/widgets/custom_customscrollview_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

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
    final loadingState = ref.watch(newsArticleListViewModelProvider);
    final listviewModel = ref.watch(newsArticleListViewModelProvider.notifier);

    return Scaffold(
      body: Builder(
        builder: (context) {
          switch (loadingState) {
            case LoadingState.searching:
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                    );
                  },
                ),
              );
            case LoadingState.completed:
              return CustomCostomScrollViewWidget(listviewModel: listviewModel,loadingState: loadingState,);
            case LoadingState.empty:
              return Center(
                child: Text(
                  "No news articles available at the moment.",
                  style: GoogleFonts.newsreader(
                      fontSize: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              return const Center(
                child: Text('Unexpected error occurred.'),
              );
          }
        },
      ),
    );
  }
}
