import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

abstract class AppColor {
  AppColor._();

  static final FlexSchemeColor _myScheme2Light =
      FlexSchemeColor.from(primary: const Color(0xFF055C34));
  static final FlexSchemeColor _myScheme2Dark =
      FlexSchemeColor.from(primary: const Color(0xFF629F80));

  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF04368E),
    secondary: const Color(0xFFA00505),
  );

  static final List<FlexSchemeData> schemes = <FlexSchemeData>[
    FlexSchemeData(
      name: 'C2: Greens',
      description: 'Vivid green theme, created from one primary color in light '
          'mode and another primary for dark mode',
      light: _myScheme2Light,
      dark: _myScheme2Dark,
    ),
    FlexSchemeData(
      name: 'C3: Red & Blue',
      description: 'Classic read and blue, created from only light theme mode '
          'primary and secondary colors',
      light: _myScheme3Light,
      dark: _myScheme3Light.toDark(),
    ),
    ...FlexColor.schemesList,
  ];
}
