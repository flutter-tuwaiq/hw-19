import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw19/services/api.dart';

Future<Response> createAccountApi({required Map body}) async {
  final box = GetStorage();

  try {
    final url = Uri.http(Api().url, Api().createAccountRoute);
    final response = await http.post(url, body: jsonEncode(body));
    final tokenBox = jsonDecode(response.body);
    final token = tokenBox['jwt'];
    box.write('token', token);
    
    return response;
  } on HttpException catch (e) {
    return Response(e.message, 400);
  } on ClientException catch (e) {
    return Response(e.message, 400);
  } catch (error) {
    return Response('server no', 111);
  }
}
