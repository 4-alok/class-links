import 'package:class_link/services/auth/repository/auth_service_repo.dart';
import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/firebase/repository/firestore_service.dart';

class ChangeUserBatch extends StatefulWidget {
  const ChangeUserBatch({Key? key}) : super(key: key);

  @override
  State<ChangeUserBatch> createState() => _ChangeUserBatchState();
}

class _ChangeUserBatchState extends State<ChangeUserBatch> {
  final TextEditingController batchText = TextEditingController();
  final TextEditingController year = TextEditingController();
  final loading = ValueNotifier<bool>(false);

  final userInfo = Get.find<HiveDatabase>().userBoxDatasources.userInfo;

  @override
  void initState() {
    batchText.text = userInfo?.batch ?? '';
    year.text = userInfo?.year.toString() ?? '';
    super.initState();
  }

  @override
  void dispose() {
    batchText.dispose();
    year.dispose();
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
              "Change User Batch",
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: SizedBox(
                              height: 48,
                              child: TextField(
                                controller: batchText,
                                textCapitalization:
                                    TextCapitalization.characters,
                                decoration: InputDecoration(
                                    hintText: userInfo?.batch,
                                    hintStyle: const TextStyle(fontSize: 12)),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SizedBox(
                                height: 48,
                                child: TextField(
                                  controller: year,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: userInfo?.year.toString(),
                                      hintStyle: const TextStyle(fontSize: 12)),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                                      .utilsDataSources
                                      .changeMyBatch(
                                          myBatch: batchText.text,
                                          year: int.parse(year.text));
                                  loading.value = false;
                                  await Get.find<AuthService>().logout;
                                  Get.offAllNamed(Routes.AUTH);
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
