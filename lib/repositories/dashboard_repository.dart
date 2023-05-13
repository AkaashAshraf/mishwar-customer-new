import 'package:gronik/model/dashboard.dart';

import '../config/api_urls.dart';
import '../http/http.dart';

abstract class DashboardRepository {
  Future<Dashboard> fetchData();
}

class DashboardRepositoryImpl implements DashboardRepository {
  final HttpClient _client;

  DashboardRepositoryImpl(this._client);

  @override
  Future<Dashboard> fetchData() async {
    final response = await _client.get(URLs.dashboardDataUrl);
    return dashboardFromJson(response);
  }
}
