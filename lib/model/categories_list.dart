import 'dart:convert';

import 'package:gronik/model/category.dart';

List<Category> categoriesFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoriesToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
