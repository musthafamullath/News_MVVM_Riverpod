import 'package:intl/intl.dart';
import 'package:news/models/news_article_model.dart';

class NewsArticleViewModel {
  final NewsArticleModel _newsArticleModel;

  NewsArticleViewModel({required NewsArticleModel article}) : _newsArticleModel = article;

  String get id => _newsArticleModel.id ?? 'Unknown ID';
  String get name => _newsArticleModel.name ?? 'Unknown Source';
  String get author => _newsArticleModel.author ?? 'Unknown Author';
  String get title => _newsArticleModel.title ?? 'No Title';
  String get description => _newsArticleModel.description ?? 'No Description';
  String get url => _newsArticleModel.url ?? 'No URL';
  String get urlToImage => _newsArticleModel.urlToImage ?? 'No Image URL';
  String get publishedAt{
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ').parse(_newsArticleModel.publishedAt.toString(),true);
    return  DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
  String get content => _newsArticleModel.content ?? 'No Content';
}
