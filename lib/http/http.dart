import 'package:http/http.dart' as http;

Future<dynamic> post(String url, dynamic body) async {
  try {
    var response = await http.post(Uri.parse(url),
        body: body,
        headers: {"Accept": "application/json", "Authorization": "Bearer"});
    if (response.statusCode == 401) {
    } else {
      return response;
    }
  } catch (e) {
    return e.toString();
  }
}

Future<dynamic> get(String url) async {
  try {
    var response = await http.get(Uri.parse(url),
        headers: {"Accept": "application/json", "Authorization": "Bearer "});

    if (response.statusCode == 401) {
      return null;
    } else {
      return response;
    }
  } catch (e) {
    return e;
  }
}

Future<dynamic> multirequestPost(dynamic request) async {
  try {
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = "Bearer ";
    request.fields['user_id'] = "";

    var res = await request.send();
    return res;
  } catch (e) {
    return null;
  }
}
