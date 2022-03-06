import 'package:class_link/app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Time", () {
    // Playground
    final date = DateTime.now();
    final s = Utils.formateDate(date);
    if (kDebugMode) {
      print(s);
    }
    expect(0, 0);
  });
}
