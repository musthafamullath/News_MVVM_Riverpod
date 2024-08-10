// String topHeadlinecontryUS =
//     'https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=152213f1c84c4edaa142b7cd1f3885f4';

// String bbc = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=152213f1c84c4edaa142b7cd1f3885f4';

class Url {
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String apiKey = '152213f1c84c4edaa142b7cd1f3885f4';

  static const String topHeadlines = 'everything?domains=techcrunch.com,thenextweb.com&apiKey=';
  static const String toBBC = 'top-headlines?sources=bbc-news&apiKey=';

  static const String combained1 = '$baseUrl$topHeadlines$apiKey';
  static const String combained2 = '$baseUrl$toBBC$apiKey';

  static String topHeadline() {
    return combained1;
  }

  static String toHeadlinesSourceBBCNews() {
    return combained2;
  }
}
