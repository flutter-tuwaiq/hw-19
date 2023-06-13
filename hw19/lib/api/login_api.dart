import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw19/api/api.dart';

Future<Response> loginApi({required Map body}) async {
  
 try{
   var url = Uri.http(AllApi().url,AllApi().login);
var response = await http.post(url, body:json.encode(body));
return response;
 }catch(error){
  print(error);
  return Response('error',400) ;
 }
}