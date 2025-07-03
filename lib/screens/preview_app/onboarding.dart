//flutter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//data
import 'package:up_todo/data/home_homeboarding.dart';
//screens
import 'package:up_todo/screens/preview_login/welcome_login.dart';
//widgets
import 'package:up_todo/widgets/on_boarding_actions.dart';
import 'package:up_todo/widgets/on_boarding_buttons.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _pageIndex = 0;
  void _goToNext() {
    setState(() {
      if (_pageIndex >= 0 && _pageIndex < actionsOnboarding.length - 1) {
        _pageIndex++;
      } else {
        _jumpToLogin();
      }
    });
  }

  void _goToPrev() {
    setState(() {
      if (_pageIndex >= 0 && _pageIndex < actionsOnboarding.length) {
        _pageIndex--;
      } else {
        return;
      }
    });
  }

  void _jumpToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const WelcomeLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: _jumpToLogin,
          child: Text(
            'SALTA',
            style: GoogleFonts.lato(
              color: Color.fromRGBO(255, 255, 255, 0.44),
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: 0,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
      body: Center(child: OnboardingActions(pageIndex: _pageIndex)),
      bottomNavigationBar: OnBoardingButtons(
        pageIndex: _pageIndex,
        goToNext: _goToNext,
        goToPrev: _goToPrev,
      ),
    );
  }
}
