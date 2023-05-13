import 'package:gronik/model/product.dart';
import 'package:gronik/model/product_list.dart';
import 'package:gronik/model/search_product.dart';

import '../config/api_urls.dart';
import '../http/http.dart';

abstract class ProductRepository {
  Future<SearchProduct?> searchProduct(String text);
  Future<List<Product>> getRelatedProduct(String id);
  Future<List<Product>> getProductsByCategory(String id);
}

class ProductRepositoryImpl implements ProductRepository {
  final HttpClient _client;

  ProductRepositoryImpl(this._client);

  @override
  Future<SearchProduct?> searchProduct(String text) async {
    final response = await _client.get(URLs.searchProduct + '?name=$text');
    return searchProductFromJson(response);
  }

  @override
  Future<List<Product>> getRelatedProduct(String id) async {
    final response = await _client.get(URLs.relatedProduct + '/$id');
    return productsFromJson(response);
  }

  @override
  Future<List<Product>> getProductsByCategory(String id) async {
    final response = await _client.get(URLs.productsByCategory + '/$id/all');
    return productsFromJson(response);
  }
}
