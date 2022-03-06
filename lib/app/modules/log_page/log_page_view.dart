import '../../models/log/log.dart';
import '../../services/log_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class LogPageView extends StatelessWidget {
  const LogPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBar,
      body: FutureBuilder<List<LogData>?>(
        future: Get.find<GoogleSheetService>().readLog,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else {
              final logs = snapshot.data ?? [];
              if (logs.isEmpty) {
                return const Center(
                  child: Text('No logs'),
                );
              } else {
                return logList(logs);
              }
            }
          }
          return const Center(
            child: Text('No data'),
          );
        },
      ));

  AppBar get appBar => AppBar(
        title: const Text('LOG'),
        centerTitle: true,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
          ),
          onPressed: () => Get.back(),
        ),
      );

  ListView logList(List<LogData> logs) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: logs.length,
        reverse: true,
        itemBuilder: (context, index) => logTIle(
          time: Utils.formateDate(logs[index].date, false, true),
          email: logs[index].email,
          name: logs[index].name,
          log: logs[index].log,
          context: context,
        ),
      );

  Padding logTIle({
    required String time,
    required String email,
    required String name,
    required String log,
    required BuildContext context,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Tooltip(
                  message: email,
                  child: Text(
                    " ~ $name",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: Get.theme.secondaryHeaderColor,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              log,
              style:
                  Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16),
            ),
          ],
        ),
      );
}
