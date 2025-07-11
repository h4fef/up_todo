//flutter
import 'package:flutter/material.dart';

class LoginWithButtons extends StatelessWidget {
  const LoginWithButtons({super.key, required this.action});
  final String action;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _googleBtn(context),
        const SizedBox(height: 20),
        _appleBtn(context),
      ],
    );
  }

  _googleBtn(context) {
    return OutlinedButton(
      onPressed: () {},
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.all(Color.fromRGBO(18, 18, 18, 1)),
        minimumSize: WidgetStateProperty.all(Size(360, 30)),
        side: WidgetStateProperty.all(
          BorderSide(color: Color(0xff8875FF), width: 1.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/google.png", width: 24, height: 24),
          const SizedBox(width: 10),
          Text(
            '${action == 'login' ? 'Login' : 'Registrati'} con Google',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  _appleBtn(context) {
    return OutlinedButton(
      onPressed: () {},
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.all(Color.fromRGBO(18, 18, 18, 1)),
        minimumSize: WidgetStateProperty.all(Size(360, 30)),
        side: WidgetStateProperty.all(
          BorderSide(color: Color(0xff8875FF), width: 1.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/apple.png", width: 24, height: 24),
          const SizedBox(width: 10),
          Text(
            '${action == 'login' ? 'Login' : 'Registrati'} con Apple',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
