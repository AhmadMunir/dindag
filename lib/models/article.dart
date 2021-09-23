import 'models.dart';

class Article {
    Article({
        this.id,
        this.title,
        this.body,
        this.image,
        this.imageSource,
        this.author,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    final String? id;
    final String? title;
    final String? body;
    final String? image;
    final String? imageSource;
    final User? author;
    final int? type;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        image: json["image"] == null ? null : json["image"],
        imageSource: json["image_source"] == null ? null : json["image_source"],
        author: json["author"] == null ? null : User.fromJson(json["author"]),
        type: json["type"] == null ? null : json["type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "image": image == null ? null : image,
        "image_source": imageSource == null ? null : imageSource,
        "type": type == null ? null : type,
    };
}