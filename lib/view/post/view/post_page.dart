import 'package:api_firebase/view/post/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController postC = PostController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post Screen"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'Name'),
                  textInputAction: TextInputAction.next,
                  controller: postC.nameC,
                ),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'Job'),
                  textInputAction: TextInputAction.done,
                  controller: postC.jobC,
                  onEditingComplete: () {
                    if (postC.nameC.text != '' && postC.jobC.text != '') {
                      postC.postData(
                          name: postC.nameC.text, job: postC.jobC.text);
                      postC.nameC.text = '';
                      postC.jobC.text = '';
                    }
                  },
                ),
                const SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          if (postC.nameC.text != '' && postC.jobC.text != '') {
                            postC
                                .postData(
                                    name: postC.nameC.text,
                                    job: postC.jobC.text)
                                .then((_) => Navigator.pop(context));
                            postC.nameC.text = '';
                            postC.jobC.text = '';
                          }
                        },
                        child: const Text('Submit')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
