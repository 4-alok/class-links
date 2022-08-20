import 'dart:math';

import 'package:class_link/global/models/event/event.dart';
import 'package:get/get.dart';

const imgList = [
  "",
  "https://images.pexels.com/photos/776086/pexels-photo-776086.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/1633406/pexels-photo-1633406.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/3974145/pexels-photo-3974145.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/258205/pexels-photo-258205.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://www.pexels.com/@david-bartus-43782/",
  "https://images.pexels.com/photos/802599/pexels-photo-802599.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/210150/pexels-photo-210150.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/594660/pexels-photo-594660.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/1089441/pexels-photo-1089441.jpeg?cs=srgb&dl=pexels-markus-spiske-1089441.jpg&fm=jpg",
];

class EventsController extends GetxController {
  
  final eventsDemoData = List.generate(
      10,
      (index) => Event(
          title: "Demo Title $index",
          description:
              "Something interesting about the event title $index and description $index for the event title $index, Description is used by writers in order to encourage their audiences to have a more specific reading of a text. An adjective modifies a noun; that is, it provides more detail about a noun. This can be anything from color to size to temperature to personality. Adjectives usually occur just before the nouns they modify.",
          creatorId: '2005847@kiit.ac.in',
          imgUrl: imgList[Random().nextInt(imgList.length)],
          dateTime: DateTime.now(),
          verified: false,
          logoUrl:
              "https://freepngimg.com/thumb/mask/9-2-anonymous-mask-free-download-png.png"));

  
}
