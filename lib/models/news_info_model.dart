class NewsInfoModel {
  final String? urlToImage;
  final String title;
  final String? description;
  final String url;
  NewsInfoModel(
      {required this.description,
      required this.title,
      required this.url,
      required this.urlToImage});
  factory NewsInfoModel.fromJson(json) {
    return NewsInfoModel(
        description: json['description'],
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage']);
  }
}
