//flutter
import 'package:flutter/material.dart';
//widgets
import 'package:up_todo/widgets/welcome_login_buttons.dart';

class WelcomeLogin extends StatelessWidget {
  const WelcomeLogin({super.key});

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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 58, bottom: 26),
              child: Text(
                "Benvenuto/a in UpTodo",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text(
              "Accedi al tuo account o crea\n un nuovo account per continuare",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Color.fromRGBO(255, 255, 255, 0.67),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WelcomeLoginButtons(),
    );
  }
}
