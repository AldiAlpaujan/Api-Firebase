import 'package:api_firebase/view/update/controller/upate_controller.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateC = UpdateController();
    var nameTxt = TextEditingController(
        text: updateC.getU.allUser[updateC.index.value].name!);
    var jobTxt = TextEditingController(
        text: updateC.getU.allUser[updateC.index.value].job!);

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Update Screen'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  autocorrect: false,
                  autofocus: false,
                  decoration: const InputDecoration(labelText: 'Name'),
                  textInputAction: TextInputAction.next,
                  controller: nameTxt,
                ),
                TextField(
                  autocorrect: false,
                  autofocus: false,
                  decoration: const InputDecoration(labelText: 'Job'),
                  controller: jobTxt,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          updateC
                              .updateUser(
                                  newName: nameTxt.text, newJob: jobTxt.text)
                              .then((_) => Navigator.pop(context));
                        },
                        child: const Text('Submit'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
