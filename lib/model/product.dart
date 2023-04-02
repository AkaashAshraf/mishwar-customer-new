import 'package:gronik/model/dashboard.dart';

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.variations,
    this.tax,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.attributes,
    this.categoryIds,
    this.choiceOptions,
    this.discount,
    this.discountType,
    this.taxType,
    this.unit,
    this.totalStock,
    this.capacity,
    this.dailyNeeds,
    this.wishlistCount,
    this.rating,
  });

  int? id;
  String? name;
  String? description;
  List<String>? image;
  int? price;
  List<Variation>? variations;
  double? tax;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<String>? attributes;
  List<CategoryId>? categoryIds;
  List<ChoiceOption>? choiceOptions;
  int? discount;
  String? discountType;
  String? taxType;
  String? unit;
  int? totalStock;
  int? capacity;
  int? dailyNeeds;
  int? wishlistCount;
  List<dynamic>? rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        price: json["price"],
        variations: json["variations"] == null
            ? []
            : List<Variation>.from(
                json["variations"]!.map((x) => Variation.fromJson(x))),
        tax: json["tax"]?.toDouble(),
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        attributes: json["attributes"] == null
            ? []
            : List<String>.from(json["attributes"]!.map((x) => x)),
        categoryIds: json["category_ids"] == null
            ? []
            : List<CategoryId>.from(
                json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
        choiceOptions: json["choice_options"] == null
            ? []
            : List<ChoiceOption>.from(
                json["choice_options"]!.map((x) => ChoiceOption.fromJson(x))),
        discount: json["discount"],
        discountType: json["discount_type"],
        taxType: json["tax_type"],
        unit: json["unit"],
        totalStock: json["total_stock"],
        capacity: json["capacity"],
        dailyNeeds: json["daily_needs"],
        wishlistCount: json["wishlist_count"],
        rating: json["rating"] == null
            ? []
            : List<dynamic>.from(json["rating"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "price": price,
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "tax": tax,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x)),
        "category_ids": categoryIds == null
            ? []
            : List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
        "choice_options": choiceOptions == null
            ? []
            : List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
        "discount": discount,
        "discount_type": discountType,
        "tax_type": taxType,
        "unit": unit,
        "total_stock": totalStock,
        "capacity": capacity,
        "daily_needs": dailyNeeds,
        "wishlist_count": wishlistCount,
        "rating":
            rating == null ? [] : List<dynamic>.from(rating!.map((x) => x)),
      };
}
