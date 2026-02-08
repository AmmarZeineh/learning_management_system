import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';

class GetBalanceService {
  Future<int> getMoney({required String id}) async {
    dynamic data = await Api().put(
      url: "$kBaseUrl/user/getStudentMoney/$id",
      body: null,
      token: null,
    );
    int money = data[0][0]["money"];
    return money;
  }
}
