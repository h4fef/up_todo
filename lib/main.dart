//flutter
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//screen
import 'package:up_todo/screens/homepage/homepage.dart';
import 'package:up_todo/screens/login/login.dart';
import 'package:up_todo/screens/preview_app/onboarding.dart';
import 'package:up_todo/screens/preview_app/splash_screen.dart';
import 'package:up_todo/screens/preview_login/welcome_login.dart';
import 'package:up_todo/screens/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UpTodo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF8685E7),
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.lato(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            side: BorderSide(width: 1.2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Color.fromRGBO(255, 255, 255, 0.44),
            textStyle: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: 0,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(151, 151, 151, 0.5)),
          ),
          hintStyle: GoogleFonts.lato(
            color: Color.fromRGBO(83, 83, 83, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(0, 0, 0, 1)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/on-boarding': (context) => OnBoarding(),
        '/welcome-login': (context) => WelcomeLogin(),
        '/login': (context) => Login(),
        '/sign-in': (context) => Register(),
        '/home': (context) => Homepage(),
      },
    );
  }
}
