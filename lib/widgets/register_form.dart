//flutter
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  "Username",
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
                    hintText: "Inserisci il tuo username",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Il campo username è obbligatorio.";
                    }
                    return null;
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
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => Homepage()),
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff8875FF),
                    minimumSize: Size(360, 30),
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
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
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
}
