class ApiALi with UserEndpoint,ConstApi{}
mixin ConstApi{
   String url = "10.0.2.2:8080";
}
mixin UserEndpoint{
  String  createAccount="/auth/Signup";
   String  loginUser="/auth/login";

  
}