Assessment: Flutter - Sign Up and Login Screens with Password Visibility and Token Key Storage

Instructions:

1. Create a Flutter app that includes a Sign Up screen.
2. Create a Flutter app that includes a Login screen.
3. Implement the functionality to show/hide the password using an eye icon.
4. Use the `projects_final` API project for authentication.
5. Save a token key in storage when the app is built again.

Tasks:

1. Create a new Flutter project 
2. Create a file named `api.dart` and implement the necessary API methods to communicate with the `projects_final` API project for authentication. You can use packages like `http` or `dio` for making API calls.
3. Implement a Sign Up screen with the following elements:
   - Text fields for entering name, email, username and password.
  
   - Sign Up button to register the user.
4. Implement a Login screen with the following elements:
   - Text fields for entering email and password.
   - Login button to authenticate the user.
5. On both the Sign Up and Login screens, implement the functionality to show/hide the password using an eye icon.
6. Implement the logic to save the token key in storage when the app is built again. You can use packages like `shared_preferences` or `getstorge` for storing the token key securely.
7. Test the app by signing up with a new user, logging in with the same user, and verifying that the token key is saved and loaded correctly.

Evaluation Criteria:

1. The Flutter app should be created successfully with the necessary dependencies and configurations. (2 points)
2. The Sign Up screen should contain the required elements, and the Sign Up button should register the user successfully. (5 points)
3. The Login screen should contain the required elements, and the Login button should authenticate the user successfully. (5 points)
4. The password fields on both screens should have an eye icon that toggles the password visibility. (3 points)
5. The app should communicate with the `projects_final` API project for authentication. (5 points)
6. The token key should be saved to storage and loaded again when the app is restarted. (5 points)

Note: This assessment assumes that students have prior knowledge of Flutter development, including API integration and handling form submissions. It also assumes the availability of the `projects_final` API project and its documentation.
