import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetUser extends StatefulWidget {
  const ResetUser({Key? key}) : super(key: key);

  @override
  State<ResetUser> createState() => _ResetUserState();
}

class _ResetUserState extends State<ResetUser> {
  final TextEditingController userId = TextEditingController();
  final loading = ValueNotifier<bool>(false);

  @override
  void initState() {
    userId.text = "@kiit.ac.in";
    super.initState();
  }

  @override
  void dispose() {
    userId.dispose();
    loading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Reset User",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: userId,
                        decoration: const InputDecoration(
                            hintText: 'enter email',
                            hintStyle: TextStyle(fontSize: 12)),
                      ),
                      const SizedBox(height: 6),
                      ValueListenableBuilder<bool>(
                        valueListenable: loading,
                        builder: (context, value, _) => ElevatedButton(
                          onPressed: value
                              ? null
                              : () async {
                                  loading.value = true;
                                  await Get.find<FirestoreService>()
                                      .userInfoDatasources
                                      .resetUser(userId.text)
                                      .then((value) => Message("Success",
                                          "User reset successfully"));
                                  loading.value = false;
                                },
                          child: value
                              ? const Center(
                                  child: SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : const Text("Change"),
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      );
}
