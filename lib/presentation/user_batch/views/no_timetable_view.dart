import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/user_batch_controller.dart';

class NoTimetableView extends StatelessWidget {
  final UserBatchController controller;
  const NoTimetableView({required this.controller, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -MediaQuery.of(context).size.height * 0.1,
              bottom: -MediaQuery.of(context).size.height * 0.3,
              right: -MediaQuery.of(context).size.width * 0.1,
              left: 0,
              child: SvgPicture.asset("assets/svg/boat.svg",
                  color: Theme.of(context).colorScheme.primary.withOpacity(.1)),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Timetable ",
                            style: TextStyle(
                              fontSize: 62,
                              fontStyle: GoogleFonts.teko().fontStyle,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "not available for your batch yet",
                            style: TextStyle(
                              fontSize: 62,
                              fontStyle: GoogleFonts.teko().fontStyle,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => controller.continueResourceOnly(),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Continue Resources Only",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontStyle: GoogleFonts.teko().fontStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      controller.email.startsWith('22')
                          ? TextButton(
                              onPressed: () => controller.on3rdLateralEntry(),
                              child: const Text(
                                "3rd year Lateral Entry? (CS/IT/CSCE,CSSE)",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
