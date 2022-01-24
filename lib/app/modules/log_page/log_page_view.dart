import '../../models/log/log.dart';
import '../../services/log_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LogPageView extends StatelessWidget {
  const LogPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('LOG'),
        centerTitle: true,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: FutureBuilder<List<LogData>?>(
        future: Get.find<GoogleSheetSerevice>().readLog(),
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

  ListView logList(List<LogData> logs) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: logs.length,
        reverse: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    logs[index].date.toString(),
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Tooltip(
                    message: logs[index].email,
                    child: Text(
                      " ~ ${logs[index].name}",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            color: Get.theme.secondaryHeaderColor,
                          ),
                    ),
                  ),
                ],
              ),
              Text(
                logs[index].log,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),

          // child: RichText(
          //   text: TextSpan(
          //     text: '${logs[index].date} \n',
          //     style: TextStyle(
          //       color: Get.theme.primaryColor,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     children: [
          //       TextSpan(
          //           text: '${logs[index].name}\n',
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodyText1!
          //               .copyWith(fontSize: 16)),
          //       // TextSpan(
          //       //     text: '${logs[index].email} \n',
          //       //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
          //       //           fontSize: 16,
          //       //           color: Get.theme.secondaryHeaderColor,
          //       //         )),
          //       TextSpan(
          //         text: logs[index].log,
          //         style: Theme.of(context)
          //             .textTheme
          //             .headline4!
          //             .copyWith(fontSize: 16),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      );
}
