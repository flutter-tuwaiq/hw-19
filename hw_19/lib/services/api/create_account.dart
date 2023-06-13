import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw_19/services/api/api.dart';

Future<Response> createAccount({required Map body}) async {
  var url = Uri.http(Api().url, Api().createAccount);
  var response = await http.post(url, body: json.encode(body));
  return response;
}
