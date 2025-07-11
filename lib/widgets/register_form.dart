//flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//screens
import 'package:up_todo/screens/homepage/homepage.dart';

//widgets
import 'package:up_todo/widgets/login_with_buttons.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  String confirmPsw = "";
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
        : SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registrati",
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
                        keyboardType: TextInputType.emailAddress,
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
                          } else if (value != confirmPsw) {
                            return "Le due password non sono uguali.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                          _validateForm();
                        },
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Conferma Password",
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
                          } else if (value != password) {
                            return "Le due password non sono uguali.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          confirmPsw = value;
                          _validateForm();
                        },
                      ),
                      const SizedBox(height: 40),
                      OutlinedButton(
                        onPressed: formValid
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    final newUser = await _auth
                                        .createUserWithEmailAndPassword(
                                          email: email,
                                          password: password,
                                        );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Registrazione avvenuta correttamente.",
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
                                          "Registrazione fallita. ${e.toString()}",
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
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>((
                                states,
                              ) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Color(0xff8875FF).withOpacity(0.4);
                                }
                                return Color(0xff8875FF);
                              }),
                          minimumSize: MaterialStateProperty.all(Size(360, 30)),
                        ),
                        child: Text(
                          'Registrati',
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
                      LoginWithButtons(action: 'Registrati'),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  _usernameInput(context) {}
}
