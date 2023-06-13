import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw19/services/api.dart';

Future<Response> logInApi({required Map body}) async {
  final box = GetStorage();

  try {
    final url = Uri.http(Api().url, Api().loginAccountRoute);
    final response = await http.post(url, body: jsonEncode(body));
    final tokenBox = jsonDecode(response.body);
    final token = tokenBox['jwt'];
    box.write('token', token);
    
    return response;
  } catch (e) {
    return Response(e.toString(), 400);
  }
}
