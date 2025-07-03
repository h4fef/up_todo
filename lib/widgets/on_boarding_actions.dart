//flutter
import 'package:flutter/material.dart';
//data
import 'package:up_todo/data/home_homeboarding.dart';

class OnboardingActions extends StatelessWidget {
  const OnboardingActions({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(actionsOnboarding[pageIndex].img),
        const SizedBox(height: 105.22),
        Text(
          actionsOnboarding[pageIndex].title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 42),
        Text(
          actionsOnboarding[pageIndex].subtitle,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
