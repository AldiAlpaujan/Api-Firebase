import 'package:api_firebase/model/user.dart';
import 'package:dio/dio.dart';

class UserUpdate extends User {
  Future<void> updateUser({required String id, required User data}) async {
    try {
      String apiUrl =
          "https://api-req-b6eed-default-rtdb.firebaseio.com/user/$id.json";
      await Dio().patch(apiUrl, data: data.toJson());
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
