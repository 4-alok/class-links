import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../global/models/event/event.dart';
import '../../../../global/utils/utils.dart';

class EventPageTile extends StatelessWidget {
  final void Function({Never returnValue}) action;
  final Event event;
  const EventPageTile({required this.action, required this.event, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            sliverAppBar,
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(Utils.formateDate(event.dateTime, false, true),
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(event.description,
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  SliverAppBar get sliverAppBar => SliverAppBar(
        stretch: true,
        pinned: false,
        floating: true,
        expandedHeight: 180,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          onPressed: () => action(),
        ),
        flexibleSpace: FlexibleSpaceBar(
          title: Hero(tag: 'event_title', child: Text(event.title)),
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
