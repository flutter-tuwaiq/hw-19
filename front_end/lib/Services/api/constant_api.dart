class Api with ConstApi, UserEndpoint {}

mixin ConstApi {
  String url = "0.0.0.0:9090";
}

mixin UserEndpoint {
  String createAccount = "/auth/create_account";
  String login = "/auth/login";
}
