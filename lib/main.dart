
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/view/news_view.dart';
import 'package:news/viewmodel/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(const MyApp());
  
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsArticleListViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade200,
            elevation: 0,
          ),
          textTheme: TextTheme(
            titleLarge: GoogleFonts.newsreader(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
            size: 32,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NewsView(),
      ),
    );
  }
}
