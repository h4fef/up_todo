//flutter
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 75, bottom: 10),
            child: Image.asset('assets/void.png', width: 227),
          ),
          Text(
            "Cosa vuoi fare oggi?",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Color.fromRGBO(255, 255, 255, 0.87),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Premi + per aggiungere i tuoi task",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Color.fromRGBO(255, 255, 255, 0.87),
            ),
          ),
        ],
      ),
    );
  }
}
