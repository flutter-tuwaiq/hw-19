import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw19/api/api.dart';

import '../pages/login.dart';

Future<Response> createUser({required Map body}) async {
  try {
    var url = Uri.http(AllApi().url, AllApi().homePage);
    var response = await http.get(url, headers: json.decode(token));
    return response;
  } catch (error) {
    print(error);
    return Response('error', 400);
  }
}
