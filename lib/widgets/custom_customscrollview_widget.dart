import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/view/show_news_article_details.dart';
import 'package:news/viewmodel/news_article_list_view_model.dart';
import 'package:news/widgets/custom_grid_tile_Image_widget.dart';
import 'package:news/widgets/custom_grid_tile_footer_widget.dart';
import 'package:shimmer/shimmer.dart';

class CustomCostomScrollViewWidget extends StatelessWidget {
  const CustomCostomScrollViewWidget({
    super.key,
    required this.listviewModel,
    required this.loadingState,
  });

  final NewsArticleListViewModel listviewModel;
  final LoadingState loadingState;

  void _showNewsArticleDetails(context, article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ShowNewsArticleDetails(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.grey.shade200,
          actions: const <Widget>[
            Icon(
              Icons.more_vert,
              size: 32,
              color: Colors.black,
            ),
          ],
          title: Text(
            'BBC NEWS',
            style: GoogleFonts.newsreader(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          expandedHeight: MediaQuery.of(context).size.height * 0.15,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            title: Text(
              'All Head Lines From British Broadcasting Corporation (BBC) News.',
              style: GoogleFonts.newsreader(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            expandedTitleScale: 1,
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisExtent: 155,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 1.375,
          ),
          delegate: SliverChildBuilderDelegate(
            (_, index) {
              if (loadingState == LoadingState.searching) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 155,
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                var articles = listviewModel.articles[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () => _showNewsArticleDetails(context, articles),
                    child: GridTile(
                      footer: CustomGridTileFooterWidget(articles: articles),
                      child: CustomGridTileImageWidget(articles: articles),
                    ),
                  ),
                );
              }
            },
            childCount: loadingState == LoadingState.searching
                ? 10 
                : listviewModel.articles.length,
          ),
        ),
      ],
    );
  }
}
