import '../config/api_urls.dart';
import '../http/http.dart';
import '../model/categories_list.dart';
import '../model/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> fetchCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  final HttpClient _client;

  CategoryRepositoryImpl(this._client);

  @override
  Future<List<Category>> fetchCategories() async {
    final response = await _client.get(URLs.categories);
    return categoriesFromJson(response);
  }
}
