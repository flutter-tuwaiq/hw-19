import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw_19_test/services/api/constant_api.dart';

Future<Response> loginUser({required Map body}) async {
  try {
    var url = Uri.http(ApiAll().url, ApiAll().loginAccount);
    var response = await http.post(url, body: json.encode(body));
    print(response.body);
    return response;
  } on HttpException catch (error) {
    return Response(error.message, 101);
  } on ArgumentError catch (error) {
    return Response(error.message, 101);
  } on ClientException catch (error) {
    return Response(error.message, 103);
  } catch (error) {
    return Response("error", 104);
  }
}
