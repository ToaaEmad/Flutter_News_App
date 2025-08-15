class NewsModel {
  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final String date;
  final String content;

  const NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.author,
    required this.date,
    required this.content,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      author: json['author'] ?? '',
      date: json['publishedAt'] ?? '',
      content: _cleanContent(json['content'] ?? ''),
    );
  }

  static String _cleanContent(String content) {
    RegExp truncatePattern = RegExp(r'\s*\[\+\d+\s*chars\]$');
    return content.replaceAll(truncatePattern, '...');
  }

}
