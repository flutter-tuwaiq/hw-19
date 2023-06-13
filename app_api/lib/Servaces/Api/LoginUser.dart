import 'dart:convert';
import 'dart:io';

import 'package:app_api/Servaces/Api/conastant_Api.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

Future<Response> loginUser({required Map body}) async {
  var url = Uri.http(AllApi().url, AllApi().login);
  var response = await http.post(url, body: json.encode(body));
  return response;
}
