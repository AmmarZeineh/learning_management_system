import 'package:learning_management_system/helper/api.dart';

class LoginService {
  login({required email, required password}) async {
    await Api().post(
      url: "http://10.0.2.2:8000/api/user/login/",
      body: {
        "email": email,
        "password": password,
      },
    );
  }
}
