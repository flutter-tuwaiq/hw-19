// implement the necessary API methods to communicate with the projects_final API project for authentication.

class Api with baseApi, routesApi {}

mixin baseApi {
  String url = 'http://0.0.0.0:8080';
}
mixin routesApi {
  String createAccountRoute = '/auth/create';
  String loginAccountRoute = '/auth/log-in';
}
