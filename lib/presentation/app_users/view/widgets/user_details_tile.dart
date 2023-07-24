import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global/utils/utils.dart';
import '../../../../services/hive/models/user_info.dart';

class UserDetailsTile extends StatelessWidget {
  final UserInfo user;
  const UserDetailsTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) => ExpansionTile(
        key: PageStorageKey(user.id),
        title: Text(
          user.userName == "" ? "Name" : user.userName,
        ),
        subtitle: Text(user.id),
        children: [
          ListTile(
            title: const Text("Year"),
            trailing: Text(
              user.year.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ListTile(
              title: const Text("Stream"),
              trailing: Text(
                user.stream,
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          ListTile(
              title: const Text("Scheme/Slot"),
              trailing: Text(
                user.slot.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          ListTile(
            title: const Text("Batch"),
            trailing: Text(
              user.batch,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ListTile(
            title: const Text("Joined"),
            subtitle: Text(
              Utils.formateDate(user.date, false, true),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
          user.role == "admin" || user.role == "mod"
              ? ListTile(
                  title: const Text("Role"),
                  subtitle: Text(
                    user.role,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 20),
                  ),
                  trailing: Wrap(
                    children: [
                      user.role == "admin"
                          ? const Tooltip(
                              message: "Only owner can change admin role",
                              child: FaIcon(FontAwesomeIcons.shieldHalved),
                            )
                          : ElevatedButton(
                              onPressed: () async {},
                              child: Text(
                                user.role == "user" ? "Viewer" : "User",
                              ),
                            ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      );
}
