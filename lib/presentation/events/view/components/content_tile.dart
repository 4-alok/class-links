import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../global/models/event/event.dart';
import '../../../../global/utils/utils.dart';
import '../page/event_tile_page.dart';

class ContentTile extends StatelessWidget {
  final Event event;
  const ContentTile({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: OpenContainer(
          closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          closedElevation: 2,
          closedColor: Theme.of(context).primaryColor.withAlpha(80),
          openColor: Theme.of(context).scaffoldBackgroundColor,
          middleColor: Theme.of(context).scaffoldBackgroundColor,
          openBuilder: (context, action) =>
              EventPageTile(action: action, event: event),
          closedBuilder: (context, action) => InkWell(
            onTap: () => action(),
            child: Ink(
              decoration: backgroundImage,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: double.maxFinite,
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            dateTime(context),
                            const Spacer(),
                            logo()
                          ]),
                          const Spacer(),
                          title(context),
                          description(context),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      );

  Widget logo() => event.logoUrl == null
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

  Widget title(BuildContext context) => Hero(
        tag: 'event_title',
        child: Text(
          event.title,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      );

  Widget description(BuildContext context) => Text(
        event.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.white),
      );

  BoxDecoration get backgroundImage => BoxDecoration(
          image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(.6), BlendMode.darken),
        fit: BoxFit.cover,
        image: CachedNetworkImageProvider(event.imgUrl, maxHeight: 180),
      ));

  Widget dateTime(BuildContext context) => Text(
        Utils.formateDate(event.dateTime, false, true),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
}
