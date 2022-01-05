import 'package:dio/dio.dart';

class UserDelete {
  Future<void> deleteUser(String id) async {
    String apiUrl =
        "https://api-req-b6eed-default-rtdb.firebaseio.com/user/$id.json";
    try {
      await Dio().delete(apiUrl);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
