import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeClass {
  static ThemeData buildTheme(BuildContext context) => ThemeData(
        primaryColor: const Color(0xffE3DEFF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xffE3DEFF),
        appBarTheme: const AppBarTheme(
            elevation: 0.0,
            color: Color(0xffE3DEFF),
            iconTheme: IconThemeData(color: Color(0xff510481)),
            actionsIconTheme: IconThemeData(color: Color(0xff601687))),
        bottomAppBarTheme: const BottomAppBarTheme(
          elevation: 0.0,
          color: Color(0xff510481),
        ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Color(0xff8829C2)),
        cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.dark),
        primaryTextTheme:
            GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)
                .copyWith(
                    headline1: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    headline2: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    headline3: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    headline4: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    headline5: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    headline6: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    subtitle1: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                    subtitle2: GoogleFonts.nunitoSans(
                      color: const Color(0xff510481),
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    caption: GoogleFonts.nunitoSans(
                        color: const Color(0xff510481),
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.32),
                    overline: GoogleFonts.nunitoSans(
                      color: const Color(0xff510481),
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    button: GoogleFonts.nunitoSans(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 1.25)),
        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xff8829C2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  static ThemeData redLightTheme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Colors.red,
          iconTheme: IconThemeData(color: Color(0xff510481)),
          actionsIconTheme: IconThemeData(color: Color(0xff601687))),
      primaryColor: Colors.green,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.green,
        disabledColor: Colors.grey,
      ));
}
