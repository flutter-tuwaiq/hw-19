class ProjectApi with Api, AuthEndpoints {}

mixin Api {
  String url = '0.0.0.0:8080';
}

mixin AuthEndpoints {
  String createAccount = '/auth/create';
  String loginAccount = '/auth/login';
}

