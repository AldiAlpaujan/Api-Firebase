import 'package:api_firebase/model/user.dart';
import 'package:dio/dio.dart';

class UserGet extends User {
  static final List<User> _allUser = [];

  List<User> get allUser => UserGet._allUser;

  Future<void> getData() async {
    String apiURL =
        "https://api-req-b6eed-default-rtdb.firebaseio.com/user.json";
    try {
      var result = await Dio().get(apiURL);

      UserGet._allUser.clear();
      if (result.data != null) {
        var jsonData = result.data as Map<String, dynamic>;

        jsonData.forEach((key, value) {
          UserGet._allUser.add(User(
            id: key,
            name: value['name'],
            job: value['job'],
          ));
        });
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.message);
    }
  }
}
