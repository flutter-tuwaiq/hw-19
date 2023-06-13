class AllApi with UserEndpoint, ConstApi {}

mixin ConstApi {
  String url = "10.0.2.2:8080";
}

mixin UserEndpoint {
  String createAccount = "/auth/create";
  String login = "/auth/login";
}
