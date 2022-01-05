import 'package:api_firebase/model/user.dart';
import 'package:api_firebase/view/post/model/user_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var postDataUser = PostDataUser().obs;
  final nameC = TextEditingController();
  final jobC = TextEditingController();

  Future<void> postData({required String name, required String job}) {
    return postDataUser.value
        .postData(data: User(name: name, job: job))
        .then((_) {});
  }

  @override
  void onClose() {
    nameC.dispose();
    jobC.dispose();
    super.onClose();
  }
}
