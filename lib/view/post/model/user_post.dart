import 'package:api_firebase/model/user.dart';
import 'package:dio/dio.dart';

class PostDataUser extends User {
  Future<void> postData({required User data}) async {
    try {
      String apiURL =
          'https://api-req-b6eed-default-rtdb.firebaseio.com/user.json';
      await Dio().post(apiURL, data: data.toJson()).then((_) {});
      // ignore: avoid_print
      print('Succesfull');
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.message);
    }
  }
}
