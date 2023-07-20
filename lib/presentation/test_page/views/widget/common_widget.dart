import 'package:flutter/material.dart';

mixin TestWidget {
  Widget testCard({required String testTitle, required Widget child}) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              testTitle,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          Card(
              child: SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: child,
                  ))),
          const SizedBox(height: 10),
        ],
      );
}
