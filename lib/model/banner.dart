class Banner {
  Banner({
    this.id = 0,
    this.title = "",
    this.image = "",
    this.productId = 0,
    this.status = 0,
    this.createdAt = "",
    this.updatedAt = "",
    this.categoryId = 0,
  });

  int id;
  String title;
  String image;
  int productId;
  int status;
  String createdAt;
  String updatedAt;
  int categoryId;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        image: json["image"] ?? "",
        productId: json["product_id"] ?? 0,
        status: json["status"] ?? 0,
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        categoryId: json["category_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "product_id": productId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category_id": categoryId,
      };
}
