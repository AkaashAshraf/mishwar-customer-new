import 'package:dio/dio.dart';

import '../config/api_urls.dart';
import '../http/http.dart';

abstract class AuthRepository {
  Future<String?> login(String phone, String code);
  Future<String?> phoneVerification(String phone, String code);
}

class AuthRepositoryImpl implements AuthRepository {
  final HttpClient _client;

  AuthRepositoryImpl(this._client);

//TODO set login acorting to setion
  @override
  Future<String?> login(String phone, String code) async {
    final response = await _client.post(URLs.login,
        body: FormData.fromMap({
          "phone": phone,
          "country_code": code,
        }));
    return response;
  }

  Future<String?> phoneVerification(String phone, String code) async {
    final response = await _client.post(URLs.verifyPhone,
        body: FormData.fromMap({
          "phone": phone,
          "country_code": code,
        }));
    return response;
  }
}
