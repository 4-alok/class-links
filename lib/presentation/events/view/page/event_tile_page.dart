import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global/models/event/event.dart';
import '../../../../global/utils/utils.dart';
import '../../../../global/widget/launcher.dart';

class EventTilePage extends StatelessWidget {
  final void Function({Never returnValue}) action;
  final Event event;
  const EventTilePage({required this.action, required this.event, Key? key})
      : super(key: key);

  MediaQueryData get mqData => MediaQueryData.fromWindow(window);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [sliverAppBar, sliverBody(context)],
        ),
      );

  SliverFillRemaining sliverBody(BuildContext context) => SliverFillRemaining(
        fillOverscroll: true,
        hasScrollBody: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: mqData.size.height,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bodyChildren(context),
              ),
            )
          ],
        ),
      );

  List<Widget> bodyChildren(BuildContext context) => [
        Text(event.description, style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 12),
        event.launchURL != null
            ? GestureDetector(
                onTap: () => Launcher.launchUrl(context, event.launchURL!),
                child: Text(
                  event.launchURL!,
                  style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 12),
        Row(
          children: [
            const Spacer(),
            Text(Utils.formateDate(event.dateTime, false, true),
                style: Theme.of(context).textTheme.headline3),
          ],
        ),
        Row(children: [
          const Spacer(),
          Text("~ ${event.creatorName}",
              style: Theme.of(context).textTheme.headline4)
        ])
      ];

  SliverAppBar get sliverAppBar => SliverAppBar(
        stretch: true,
        pinned: false,
        floating: true,
        expandedHeight: 180,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
          onPressed: () => action(),
        ),
        flexibleSpace: FlexibleSpaceBar(
          title: SafeArea(child: Text(event.title)),
          background: CachedNetworkImage(
            color: Colors.black.withOpacity(.4),
            colorBlendMode: BlendMode.darken,
            filterQuality: FilterQuality.high,
            imageUrl: event.imgUrl,
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => const SizedBox(),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10), child: logo)
        ],
      );

  Widget get logo => event.logoUrl == null
      ? const SizedBox()
      : SizedBox(
          height: 30,
          width: 30,
          child: CachedNetworkImage(
            imageUrl: event.logoUrl!,
            placeholder: (context, url) => const SizedBox(),
            errorWidget: (context, url, error) => const SizedBox(),
          ),
        );
}
