import 'package:api_firebase/view/get/controller/get_cotroller.dart';
import 'package:api_firebase/view/post/view/post_page.dart';
import 'package:api_firebase/view/update/controller/upate_controller.dart';
import 'package:api_firebase/view/update/view/update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetPage extends StatelessWidget {
  const GetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var refresh = true.obs;
    final getController = GetController();
    final updateC = UpdateController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All User'),
        actions: [
          IconButton(
              onPressed: () {
                refresh.value = false;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostPage())).then((_) {
                  refresh.value = true;
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(
        () => refresh.value == true
            ? FutureBuilder(
                future: getController.pickData(),
                builder: (context, _) {
                  return (getController.userGet.value.allUser.isEmpty)
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'No data yet',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    refresh.value = false;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PostPage())).then((_) {
                                      refresh.value = true;
                                    });
                                  },
                                  child: const Text('Add Data'))
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: getController.userGet.value.allUser.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              refresh.value = false;
                              updateC.index.value = index;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UpdatePage(),
                                  )).then((_) => refresh.value = true);
                            },
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            title: Text(getController
                                .userGet.value.allUser[index].name
                                .toString()),
                            subtitle: Text(
                              'date time',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () async {
                                  refresh.value = false;
                                  getController.deleteData(
                                      getController
                                          .userGet.value.allUser[index].id!,
                                      index);

                                  refresh.value = true;
                                },
                                icon: const Icon(Icons.delete)),
                          ),
                        );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
