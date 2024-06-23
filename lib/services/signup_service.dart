import 'package:learning_management_system/helper/api.dart';

class SignupService {
  Future<void> SignUp(
      {required email,
      required phone,
      required username,
      required password,
      required role}) async {
    await Api().post(url: "http://10.0.2.2:8000/api/user/register", body: {
      "email": email,
      "password": password,
      "phonenumber": phone,
      "username": username,
      "role": role,
    });
  }
}
