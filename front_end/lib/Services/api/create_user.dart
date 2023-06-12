import 'dart:convert';

import 'constant_api.dart';
import 'package:http/http.dart' as http;

createUser({required Map body}) async {
  var url = Uri.http(Api().url, Api().createAccount);
  var response = await http.post(url, body: json.encode(body));
  return response;
}
