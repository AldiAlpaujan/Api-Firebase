import 'package:api_firebase/model/user.dart';
import 'package:api_firebase/view/get/model/user_get.dart';
import 'package:api_firebase/view/update/model/user_update.dart';

import 'package:get/get.dart';

class UpdateController extends GetxController {
  var index = 0.obs;
  var updateU = UserUpdate();
  var getU = UserGet();

  Future<void> updateUser({required String newName, required String newJob}) {
    return updateU
        .updateUser(
            id: getU.allUser[index.value].id!,
            data: User(name: newName, job: newJob))
        .then((_) {});
  }
}
