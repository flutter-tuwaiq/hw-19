class AllApi with UserEndpoint, ConstApi{}

mixin ConstApi{
 String url = '10.0.2.2:8080';
}
mixin UserEndpoint{
   String signup = '/auth/create';
   String login = '/auth/login';
   String homePage = '/user//get_orders';
}