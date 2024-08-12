// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/viewmodel/news_article_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ShowNewsArticleDetails extends StatelessWidget {
  const ShowNewsArticleDetails({
    super.key,
    required this.article,
  });

  final NewsArticleViewModel? article;

  @override
  Widget build(BuildContext context) {
    print(article);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade500,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: Text(
                    article!.author.substring(0, 1),
                    style: GoogleFonts.newsreader(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: double.infinity,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          article!.name,
                          style: GoogleFonts.newsreader(fontSize: 16),
                        ),
                        Text(
                          "\t\t(${article!.id})",
                          style: GoogleFonts.newsreader(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      article!.author,
                      style: GoogleFonts.newsreader(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Divider(
                    color: Colors.grey.shade500,
                    thickness: 22.5,
                    height: 40,
                  ),
                  Text(
                    "\t\tHeadline",
                    style: GoogleFonts.newsreader(
                        fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article!.title,
                style: GoogleFonts.newsreader(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article!.publishedAt,
                style: GoogleFonts.newsreader(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade500),
                child: CachedNetworkImage(
                  imageUrl: article!.urlToImage,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  height: 240,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article!.url,
                style: GoogleFonts.newsreader(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article!.description,
                style: GoogleFonts.newsreader(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article!.content,
                style: GoogleFonts.newsreader(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
