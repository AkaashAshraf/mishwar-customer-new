import 'package:gronik/model/translation.dart';

class Category {
  Category({
    this.id,
    this.name,
    this.parentId,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.translations,
  });

  int? id;
  String? name;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? image;
  List<Translation>? translations;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        position: json["position"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        image: json["image"],
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "position": position,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "image": image,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}
