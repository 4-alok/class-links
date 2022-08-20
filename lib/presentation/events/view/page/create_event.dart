// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// import '../../controller/event_controller.dart';

// class CreateEventPage extends StatefulWidget {
//   final EventsController controller;
//   const CreateEventPage({required this.controller, Key? key}) : super(key: key);

//   @override
//   State<CreateEventPage> createState() => _CreateEventPageState();
// }

// class _CreateEventPageState extends State<CreateEventPage> {
//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final creatorNameController = TextEditingController();
//   final launchUrlController = TextEditingController();
//   final imgURLController = TextEditingController();
//   final logoUrlController = TextEditingController();
//   DateTime? dateTime;

//   @override
//   void initState() {
//     creatorNameController.text =
//         widget.controller.hiveDatabase.userBoxDatasources.userInfo?.userName ??
//             "";
//     super.initState();
//   }

//   @override
//   void dispose() {
//     titleController.dispose();
//     descriptionController.dispose();
//     creatorNameController.dispose();
//     launchUrlController.dispose();
//     imgURLController.dispose();
//     logoUrlController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: appBar,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(labelText: "Title"),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: descriptionController,
//               minLines: 5,
//               maxLines: 10,
//               decoration: const InputDecoration(labelText: "Description"),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: creatorNameController,
//               decoration: const InputDecoration(labelText: "Creator name"),
//             ),
//           ],
//         ),
//       ));

//   AppBar get appBar => AppBar(
//         leading: Hero(
//           tag: "back",
//           child: Material(
//               child: IconButton(
//                   icon: const FaIcon(FontAwesomeIcons.arrowLeft),
//                   onPressed: () => Get.back())),
//         ),
//         centerTitle: true,
//         title: const Text("Add Event"),
//       );
// }
