//flutter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({
    super.key,
    required this.pageIndex,
    required this.goToPrev,
    required this.goToNext,
  });
  final int pageIndex;
  final VoidCallback goToPrev;
  final VoidCallback goToNext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 55),
      child: Row(
        mainAxisAlignment: pageIndex > 0
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (pageIndex > 0)
            TextButton(onPressed: goToPrev, child: Text('INDIETRO')),
          OutlinedButton(
            onPressed: goToNext,
            style: OutlinedButton.styleFrom(backgroundColor: Color(0xff8875FF)),
            child: Text(
              pageIndex != 2 ? 'AVANTI' : 'INIZIA',
              style: GoogleFonts.lato(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
