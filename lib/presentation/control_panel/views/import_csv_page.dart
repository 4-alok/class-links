// import 'package:dropdown_button2/custom_dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/controller_panel_controller.dart';
// import 'control_panel_page.dart';

// class ControlPanel extends GetView<ControlPanelController> {
//   const ControlPanel({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(title: const Text("Control Panel")),
//         body: Obx(
//           () => controller.csvController.field.isEmpty
//               ? ControlPanelPage(controller: controller)
//               : importCsvPage(context),
//         ),
//         floatingActionButton: fab,
//       );

//   Widget importCsvPage(BuildContext context) => Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ListView(
//           physics: const BouncingScrollPhysics(),
//           children: [
//             const SizedBox(height: 12),
//             dayWidget,
//             batchWidget,
//             room1Widget,
//             room2Widget,
//             room3Widget,
//             Card(
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: "Year",
//                   hintText: "2020",
//                   border: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                 ),
//                 onChanged: (val) => val != ''
//                     ? controller.csvController.year.value =
//                         int.tryParse(val) ?? 2020
//                     : null,
//               ),
//             ),
//             Card(
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: "Slot",
//                   hintText: "1",
//                   border: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                 ),
//                 onChanged: (val) => val != ''
//                     ? controller.csvController.slot.value =
//                         int.tryParse(val) ?? 1
//                     : null,
//               ),
//             ),
//             Card(
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: "Creator ID",
//                   hintText: "2005847@kiit.ac.in",
//                   border: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                 ),
//                 onChanged: (val) => val != ''
//                     ? controller.csvController.creatorId.value = val
//                     : null,
//               ),
//             ),
//             const SizedBox(height: 12),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 "Timing slot",
//                 textAlign: TextAlign.start,
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//             Card(
//                 child: Wrap(
//               children: controller.csvController.subjectTimes
//                   .map((e) => Card(
//                         color: Theme.of(context)
//                             .colorScheme
//                             .primary
//                             .withOpacity(.1),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 2),
//                           child: Text(e),
//                         ),
//                       ))
//                   .toList(),
//             )),
//             ElevatedButton(
//               onPressed: () => controller.csvController.printTimetable,
//               child: const Text("Print"),
//             )
//           ],
//         ),
//       );

//   Widget get room1Widget => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               "Select Room-1 column",
//               textAlign: TextAlign.start,
//               style: TextStyle(fontSize: 12),
//             ),
//           ),
//           Card(
//             child: SizedBox(
//               height: 48,
//               width: double.maxFinite,
//               child: Obx(
//                 () => CustomDropdownButton2(
//                   hint: 'Room No',
//                   buttonElevation: 5,
//                   dropdownItems: controller.csvController.field.first
//                       .map((e) => e.toString())
//                       .toList(),
//                   onChanged: (String? value) =>
//                       controller.csvController.r1.value = value,
//                   value: controller.csvController.r1.value,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );

//   Widget get room2Widget => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               "Select Room-2 column",
//               textAlign: TextAlign.start,
//               style: TextStyle(fontSize: 12),
//             ),
//           ),
//           Card(
//             child: SizedBox(
//               height: 48,
//               width: double.maxFinite,
//               child: Obx(
//                 () => CustomDropdownButton2(
//                   hint: 'Room No',
//                   buttonElevation: 5,
//                   dropdownItems: controller.csvController.field.first
//                       .map((e) => e.toString())
//                       .toList(),
//                   onChanged: (String? value) =>
//                       controller.csvController.r2.value = value,
//                   value: controller.csvController.r2.value,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );

//   Widget get room3Widget => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               "Select Room-2 column",
//               textAlign: TextAlign.start,
//               style: TextStyle(fontSize: 12),
//             ),
//           ),
//           Card(
//             child: SizedBox(
//               height: 48,
//               width: double.maxFinite,
//               child: Obx(
//                 () => CustomDropdownButton2(
//                   hint: 'Room No',
//                   buttonElevation: 5,
//                   dropdownItems: controller.csvController.field.first
//                       .map((e) => e.toString())
//                       .toList(),
//                   onChanged: (String? value) =>
//                       controller.csvController.r3.value = value,
//                   value: controller.csvController.r3.value,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );

//   Widget get batchWidget => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               "Select batch column",
//               textAlign: TextAlign.start,
//               style: TextStyle(fontSize: 12),
//             ),
//           ),
//           Card(
//             child: SizedBox(
//               height: 48,
//               width: double.maxFinite,
//               child: Obx(
//                 () => CustomDropdownButton2(
//                   hint: 'Batch',
//                   buttonElevation: 5,
//                   dropdownItems: controller.csvController.field.first
//                       .map((e) => e.toString())
//                       .toList(),
//                   onChanged: (String? value) =>
//                       controller.csvController.batch.value = value,
//                   value: controller.csvController.batch.value,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );

//   Widget get dayWidget => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               "Select day column",
//               textAlign: TextAlign.start,
//               style: TextStyle(fontSize: 12),
//             ),
//           ),
//           Card(
//             child: SizedBox(
//               height: 48,
//               width: double.maxFinite,
//               child: Obx(
//                 () => CustomDropdownButton2(
//                   hint: 'Day',
//                   buttonElevation: 5,
//                   dropdownItems: controller.csvController.field.first
//                       .map((e) => e.toString())
//                       .toList(),
//                   onChanged: (String? value) =>
//                       controller.csvController.day.value = value,
//                   value: controller.csvController.day.value,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );

//   Widget get fab => Obx(
//         () => controller.csvController.field.isEmpty
//             ? const SizedBox()
//             : ElevatedButton(
//                 onPressed: () => controller.csvController.import,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: AnimatedSize(
//                     duration: const Duration(milliseconds: 200),
//                     child: Obx(
//                       () => controller.csvController.count.value == null
//                           ? const Text(
//                               "Import",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             )
//                           : Text(
//                               "Import (${controller.csvController.count.value})",
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                     ),
//                   ),
//                 ),
//               ),
//       );
// }
