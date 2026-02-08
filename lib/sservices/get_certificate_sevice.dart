import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';

class GetCertificateService {
  Future<void> downloadCeteficate({required String userId, context}) async {
    try {
      await Api().put(
        url: "$kBaseUrl/user/downloadCertificate/$userId",
        body: null,
        token: null,
      );
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<dynamic> getCertificatePath({
    required String courseId,
    required String userId,
    myContext,
  }) async {
    try {
      dynamic data = await Api().put(
        url: "$kBaseUrl/user/createCertificate/$courseId/$userId",
        body: null,
        token: null,
      );
      return data["file_url"];
    } on Exception catch (e) {
      showSnackBar(myContext, e.toString());
    }
  }
}
