import 'package:api_firebase/view/get/model/user_delete.dart';
import 'package:api_firebase/view/get/model/user_get.dart';
import 'package:get/get.dart';

class GetController extends GetxController {
  var userGet = UserGet().obs;
  final _userDelete = UserDelete();

  Future<void> pickData() {
    return userGet.value.getData().then((_) {});
  }

  Future<void> deleteData(String id, int index) {
    return _userDelete.deleteUser(id).then((_) {
      userGet.value.allUser.removeWhere(
          (element) => element.id == userGet.value.allUser[index].id!);
    });
  }
}
