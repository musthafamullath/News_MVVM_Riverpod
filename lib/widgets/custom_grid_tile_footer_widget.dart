import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/viewmodel/news_article_view_model.dart';

class CustomGridTileFooterWidget extends StatelessWidget {
  const CustomGridTileFooterWidget({
    super.key,
    required this.articles,
  });

  final NewsArticleViewModel articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
            top: 40, bottom: 0, left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            articles.title,
            style: GoogleFonts.newsreader(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
              wordSpacing: 0.5,
              letterSpacing: 0.3,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
