import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

// const BaseUrl = "http://0.0.0.0:8080";

// use your Ip if you want to run it on Emulator
// ex:
// use "ipconfig" in cmd to find the IP

const BaseUrl = "http://192.168.1.16:8080";


const AuthUrlLogin = "/login/";
const AuthUrlCreate = "/create/";

class api {
  GetStorage box = GetStorage();




  Future<dynamic> userLogin(email, password) async {
    print("userLogin $email $password");

    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({"email": "$email", "password": "$password"});
    var response = await http.post(Uri.parse('$BaseUrl$AuthUrlLogin'), headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      var jwtToken = data['jwt'];
      await box.write('jwt', jwtToken);

    } else {

    }
    return null;
  }

  Future<dynamic> userCreate(email, password,username,name) async {
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "email": "$email", "password": "$password",
      "username": "$username", "name": "$name"
    });
    var response = await http.post(Uri.parse('$BaseUrl$AuthUrlCreate'), headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var jwtToken = data['jwt'];
      await box.write('jwt', jwtToken);

    } else {

    }
    return null;
  }
}

