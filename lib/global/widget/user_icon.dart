import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../services/auth/repository/auth_service_repo.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    super.key,
    required this.radius,
    this.noUser = false,
  });
  final double? radius;
  final bool noUser;

  @override
  Widget build(BuildContext context) => CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: noUser
          ? personIcon()
          : ClipOval(
              child: CachedNetworkImage(
                placeholder: (_, __) => personIcon(),
                imageUrl: Get.find<AuthService>().getUser?.photoURL ?? "",
                errorWidget: (_, __, ___) => personIcon(),
                fit: BoxFit.cover,
              ),
            ));

  FaIcon personIcon() => const FaIcon(FontAwesomeIcons.user);
}
