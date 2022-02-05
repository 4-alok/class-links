import '../../../models/user_info/user_info.dart';
import '../../../services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

  FirestoreService get firestoreService => Get.find<FirestoreService>();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          onPressed: () => Get.back(),
        ),
        title: const Text('Admin Page'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<UserInfo>>(
        stream: firestoreService.userList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userList = snapshot.data ?? [];
            return RawScrollbar(
              thickness: 12,
              thumbColor: Theme.of(context).colorScheme.primaryContainer,
              radius: const Radius.circular(6),
              minThumbLength: 100,
              interactive: true,
              child: ListView.builder(
                itemCount: userList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ExpansionTile(
                  key: PageStorageKey(userList[index].id),
                  title: Text(
                    userList[index].userName == ""
                        ? "Name"
                        : userList[index].userName,
                  ),
                  subtitle: Text(userList[index].id),
                  children: [
                    ListTile(
                      title: const Text("Year"),
                      trailing: Text(
                        userList[index].year.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    ListTile(
                        title: const Text("Stream"),
                        trailing: Text(
                          userList[index].stream,
                          style: Theme.of(context).textTheme.headline4,
                        )),
                    ListTile(
                        title: const Text("Scheme/Slot"),
                        trailing: Text(
                          userList[index].slot.toString(),
                          style: Theme.of(context).textTheme.headline4,
                        )),
                    ListTile(
                      title: const Text("Batch"),
                      trailing: Text(
                        userList[index].batch,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    ListTile(
                      title: const Text("Joined"),
                      subtitle: Text(
                        userList[index].date.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      title: const Text("Role"),
                      subtitle: Text(
                        userList[index].role,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 20),
                      ),
                      trailing: Wrap(
                        children: [
                          userList[index].role == "admin"
                              ? const Tooltip(
                                  message: "Only owner can change admin role",
                                  child: FaIcon(FontAwesomeIcons.shieldAlt),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    final res = await firestoreService
                                        .updateUser(userList[index].copyWith(
                                            role: userList[index].role == "user"
                                                ? "viewer"
                                                : "user"));
                                    if (res) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Changed to viewer")));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Failed to change")));
                                    }
                                  },
                                  child: Text(
                                    userList[index].role == "user"
                                        ? "Viewer"
                                        : "User",
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ));
}
