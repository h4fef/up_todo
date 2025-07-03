//flutter
import 'package:flutter/material.dart';
//screens
import 'package:up_todo/screens/login/login.dart';
import 'package:up_todo/screens/register/register.dart';

class WelcomeLoginButtons extends StatelessWidget {
  const WelcomeLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 24, right: 24, bottom: 67),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => Login()),
              );
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xff8875FF),
              minimumSize: Size(344, 30),
            ),
            child: Text('LOGIN', style: Theme.of(context).textTheme.bodySmall),
          ),
          const SizedBox(height: 28),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => Register()),
              );
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromRGBO(18, 18, 18, 1),
              minimumSize: Size(344, 30),
              side: BorderSide(color: Color(0xff8875FF)),
            ),
            child: Text(
              'CREA UN ACCOUNT',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
