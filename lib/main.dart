import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/view/news_view.dart';

void main() {
  runApp(
   const ProviderScope(
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade400,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.newsreader(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),
        ),
        iconTheme:const IconThemeData(
          color: Colors.black,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewsView(),
    );
  }
}
