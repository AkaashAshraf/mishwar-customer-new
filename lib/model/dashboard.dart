// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

import 'package:gronik/model/banner.dart';
import 'package:gronik/model/category.dart';
import 'package:gronik/model/product.dart';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  Dashboard({
    this.banners,
    this.categories,
    this.products,
  });

  List<Banner>? banners;
  List<Category>? categories;
  List<Product>? products;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        banners: json["banners"] == null
            ? []
            : List<Banner>.from(
                json["banners"]!.map((x) => Banner.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class CategoryId {
  CategoryId({
    this.id,
    this.position,
  });

  String? id;
  int? position;

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["id"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
      };
}

class ChoiceOption {
  ChoiceOption({
    this.name,
    this.title,
    this.options,
  });

  String? name;
  String? title;
  List<String>? options;

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
        name: json["name"],
        title: json["title"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
      };
}

class Variation {
  Variation({
    this.type,
    this.price,
    this.stock,
  });

  String? type;
  int? price;
  int? stock;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        type: json["type"],
        price: json["price"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
        "stock": stock,
      };
}
