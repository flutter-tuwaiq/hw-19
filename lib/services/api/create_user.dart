import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw_19_test/services/api/constant_api.dart';

Future<Response> createUser({required Map body}) async {
  try {
    var url = Uri.http(ApiAll().url, ApiAll().createAccount);
    var response = await http.post(url, body: json.encode(body));
    
    print(response);
    return response;
  } on HttpException catch (error) {
    return Response(error.message, 101);
  } on ArgumentError catch (error) {
    return Response(error.message, 102);
  } on ClientException catch (error) {
    return Response(error.message, 103);
  } on FormatException catch (error) {
    print(error);
    return Response(error.message, 104);
  } catch (error) {
    print(error);
    return Response("error", 105);
  }
}
