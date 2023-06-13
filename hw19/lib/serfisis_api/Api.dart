import 'dart:convert';

 import 'package:http/http.dart' as http;

 Future<http.Response> signup(Map data) async {
   var uri = Uri.parse("http://0.0.0.0:8080/auth/create");
   var response = await http.post(uri, body: jsonEncode(data));

   return response;
 }

 Future<http.Response> login(Map data) async {
   var uri = Uri.parse("http://0.0.0.0:8080/auth/login");
   var response = await http.post(uri, body: jsonEncode(data));

   return response;
 }
