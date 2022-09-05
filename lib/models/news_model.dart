class NewsModel {
  final String image;
  final String title;
  final String text;
  final String type;
  final String srcName;
  final String srcUrl;
  final String srcText;
  final String created;

  NewsModel(this.image, this.title, this.text, this.type, this.srcName,
      this.srcUrl, this.srcText, this.created);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(json["image"], json["title"], json["text"], json["type"],
        json["src_name"], json["src_url"], json["src_text"], json["created"]);
  }

  static List<NewsModel> parseList(List<dynamic> list) {
    return list.map((i) => NewsModel.fromJson(i)).toList();
  }
}
