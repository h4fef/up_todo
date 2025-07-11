//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//screens
import 'package:up_todo/screens/homepage/homepage.dart';

//widgets
import 'package:up_todo/widgets/login_with_buttons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool showSpinner = false;
  bool formValid = false;

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      formValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSpinner
        ? Center(child: CircularProgressIndicator(color: Color(0xff8875FF)))
        : Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Color.fromRGBO(255, 255, 255, 0.87),
                  ),
                ),
                const SizedBox(height: 53),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.lato(
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Inserisci la tua email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Il campo email è obbligatorio.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                          _validateForm();
                        },
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Password",
                        style: GoogleFonts.lato(
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "********"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Il campo password è obbligatorio.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                          _validateForm();
                        },
                      ),
                      const SizedBox(height: 69),
                      OutlinedButton(
                        onPressed: formValid
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    final userLogin = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                          email: email,
                                          password: password,
                                        );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Login avvenuto correttamente.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Color.fromRGBO(
                                                  255,
                                                  255,
                                                  255,
                                                  0.87,
                                                ),
                                              ),
                                        ),
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => Homepage(),
                                      ),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Login fallito: ${e.toString()}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Color.fromRGBO(
                                                  255,
                                                  255,
                                                  255,
                                                  0.87,
                                                ),
                                              ),
                                        ),
                                      ),
                                    );
                                  } finally {
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  }
                                }
                              }
                            : null,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xff8875FF),
                          minimumSize: Size(360, 30),
                        ),
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(height: 31),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 14,
                            ),
                            child: Text(
                              "OPPURE",
                              style: GoogleFonts.lato(
                                color: Color.fromRGBO(151, 151, 151, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 29),
                      LoginWithButtons(action: 'login'),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
