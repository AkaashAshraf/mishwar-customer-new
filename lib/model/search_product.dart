import 'dart:convert';

import 'product.dart';

SearchProduct searchProductFromJson(String str) =>
    SearchProduct.fromJson(json.decode(str));

String searchProductToJson(SearchProduct data) => json.encode(data.toJson());

class SearchProduct {
  int? totalSize;
  dynamic limit;
  dynamic offset;
  List<Product>? products;

  SearchProduct({
    this.totalSize,
    this.limit,
    this.offset,
    this.products,
  });

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "limit": limit,
        "offset": offset,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
