class ApiAll with UserEndpoint, ConstApi {}

mixin ConstApi {
  String url = "0.0.0.0:8080";
}

mixin UserEndpoint {
  String createAccount = "/auth/create";
  String loginAccount = "/auth/login";
}
