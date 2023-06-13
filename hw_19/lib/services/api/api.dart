class Api with ConstApi, AuthEndpoint {}

mixin ConstApi {
  String url = "0.0.0.0:8080";
}

mixin AuthEndpoint {
  String createAccount = "/auth/create";
  String login = "/auth/login";
}
