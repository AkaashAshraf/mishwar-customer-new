// import 'package:http/http.dart' as http;

// Future<dynamic> post(String url, dynamic body) async {
//   try {
//     var response = await http.post(Uri.parse(url),
//         body: body,
//         headers: {"Accept": "application/json", "Authorization": "Bearer"});
//     if (response.statusCode == 401) {
//     } else {
//       return response;
//     }
//   } catch (e) {
//     return e.toString();
//   }
// }

// Future<dynamic> get(String url) async {
//   try {
//     var response = await http.get(Uri.parse(url),
//         headers: {"Accept": "application/json", "Authorization": "Bearer "});

//     if (response.statusCode == 401) {
//       return null;
//     } else {
//       return response;
//     }
//   } catch (e) {
//     return e;
//   }
// }

// Future<dynamic> multirequestPost(dynamic request) async {
//   try {
//     request.headers['Accept'] = 'application/json';
//     request.headers['Authorization'] = "Bearer ";
//     request.fields['user_id'] = "";

//     var res = await request.send();
//     return res;
//   } catch (e) {
//     return null;
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gronik/http/error_handler.dart';
import 'package:meta/meta.dart';

import '../config/api_urls.dart';

abstract class HttpClient {
  Future<dynamic> get(String url,
      {Map<String, dynamic> headers,
      Map<String, dynamic> queryParameters,
      bool authorization = false});
  Future<dynamic> post(String url,
      {Map<String, dynamic> headers,
      @required body,
      bool authorization = false});
  // Future<dynamic> put(String url,
  //     {Map headers, @required body, bool authorization = false});
}

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  HttpClientImpl(this._dio) {
    _initApiClient();
  }

  void _initApiClient() {
    _dio..options.baseUrl = URLs.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, rv) async {
          return null;
        },
        onResponse: (Response response, rih) async {
          return null;
        },
        onError: (DioError e, aih) async {
          // if (e.response.data['message'] == 'Invalid JWT Token') {
          //   Modular.to.pushReplacementNamed(Routers.userLogin);
          // }

          return;
        },
      ),
    );
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool authorization = false,
  }) async {
    try {
      if (authorization) {
        _dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (RequestOptions options, handler) async {
              if (!options.headers.containsKey("Authorization")) {
                // options.headers["Authorization"] =
                //     "Bearer ${AuthStore.to.token}";
              }
              return;
            },
            onResponse: (Response response, handler) async {
              log('API: $url, error: $response, message: ${response.data}');
              return;
            },
            onError: (DioError e, handler) async {
              log('API: $url, error: ${e.error}, message: ${e.message}  ');

              return;
            },
          ),
        );
      }
      log('API: $url, Called  ');
      final response = await Dio().get(
        url,
        // queryParameters: queryParameters,
        // options: Options(headers: headers),
      );
      log('API: $url, response: $response}  ');

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - GET] Server Response: $res');

      return json.encode(response.data);
    } on DioError catch (e) {
      log('API: $url, error: ${e.error}}, message: ${e.message}  ');
      if (e.response?.data != null) throw Exception(e.response!.data);

      throw Exception(e.message);
    } catch (e) {
      log('API: $url, error: $e}  ');
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? headers,
    @required body,
    bool authorization = false,
  }) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');

      if (authorization) {
        _dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (RequestOptions options,
                RequestInterceptorHandler handler) async {
              if (!options.headers.containsKey("Authorization")) {
                // options.headers["Authorization"] =
                //     "Bearer ${AuthStore.to.token}";
              }
              // return options;
            },
            onResponse: (Response response, handler) async {
              // return response;
            },
            onError: (DioError e, handler) async {
              // if (e.response.data['message'] == 'Invalid JWT Token') {
              //   Modular.to.pushReplacementNamed(Routers.userLogin);
              // }

              return;
            },
          ),
        );
      }
      final response = await Dio().post(url, data: body);
      return json.encode(response.data);
    } on DioError catch (e) {
      ApiErrorHanlder.showError(e.response?.statusCode!, e.response, url);
    }
  }

  // @override
  // Future put(
  //   String url, {
  //   Map headers,
  //   @required body,
  //   bool authorization = false,
  // }) async {
  //   try {
  //     // print('[API Dio Helper - POST] Server Request: $body');
  //     if (authorization) {
  //       _dio.interceptors.add(
  //         InterceptorsWrapper(
  //           onRequest: (RequestOptions options) async {
  //             print('TOKENN >>> ${AuthStore.to.token}');

  //             if (!options.headers.containsKey("Authorization") &&
  //                 AuthStore.to.token != null) {
  //               options.headers["Authorization"] =
  //                   "Bearer ${AuthStore.to.token}";
  //             }
  //             return options;
  //           },
  //           onResponse: (Response response) async {
  //             return response;
  //           },
  //           onError: (DioError e) async {
  //             // if (e.response.data['message'] == 'Invalid JWT Token') {
  //             //   Modular.to.pushReplacementNamed(Routers.userLogin);
  //             // }

  //             return e;
  //           },
  //         ),
  //       );
  //     }

  //     final response =
  //         await _dio.put(url, data: body, options: Options(headers: headers));

  //     // final String res = json.encode(response.data);
  //     // print('[API Dio Helper - POST] Server Response: ' + res);

  //     return response.data;
  //   } on DioError catch (e) {
  //     // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

  //     if (e?.response?.data != null) throw ServerException(e.response.data);

  //     throw Exception(e.message);
  //   }
  // }
}
