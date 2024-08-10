import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/viewmodel/news_article_view_model.dart';

class CustomGridTileImageWidget extends StatelessWidget {
  const CustomGridTileImageWidget({
    super.key,
    required this.articles,
  });

  final NewsArticleViewModel articles;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: articles.urlToImage,
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.only(
            top: 10, bottom: 37, left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
        child: SpinKitFadingCircle(
          color: Colors.blueAccent,
          size: 50.0,
        ),
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}

