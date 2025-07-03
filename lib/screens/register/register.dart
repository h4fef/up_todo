//flutter
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//widgets
import 'package:up_todo/widgets/register_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        leading: IconButton(
          padding: EdgeInsets.only(left: 24, top: 13),
          icon: Icon(Icons.arrow_back_ios_rounded, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: RegisterForm(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 33),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "Hai già un account? ",
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(151, 151, 151, 1),
                ),
                children: [
                  TextSpan(
                    text: "Login",
                    style: GoogleFonts.lato(
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
