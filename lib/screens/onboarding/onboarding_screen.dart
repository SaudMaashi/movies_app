import 'package:flutter/material.dart';
import 'package:movies_app/widgets/onboarding_screen_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(),
        children: const [
          OnboardingScreenWidget(
              isButton: false,
              step: 1,
              text:
                  "Lets discover the\nworld of movies\n\nSwipe to the Right ..."),
          OnboardingScreenWidget(
              isButton: false,
              step: 2,
              text: "Create your own\nworld of movies"),
          OnboardingScreenWidget(
              isButton: true, step: 3, text: "Lets get started enjoy"),
        ],
      ),
    );
  }
}
