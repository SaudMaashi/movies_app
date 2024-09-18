import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/utilities/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnboardingScreenWidget extends StatelessWidget {
  final String text;
  final int step;
  final bool isNext;
  const OnboardingScreenWidget({
    super.key,
    required this.text,
    required this.step,
    required this.isNext,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        right: 0,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const HomeScreen();
                              }));
                            },
                            child: Text(
                              isNext ? "Continue" : "Skip",
                              style: const TextStyle(fontSize: 24),
                            )))
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 32, fontFamily: "InriaSans"),
                              children: [
                                TextSpan(text: "Your"),
                                TextSpan(
                                    text: "Quiz",
                                    style: TextStyle(color: kPrimaryColor)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(text, style: const TextStyle(fontSize: 40)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              const Spacer(),
              StepProgressIndicator(
                  totalSteps: 3,
                  currentStep: step,
                  selectedColor: kPrimaryColor),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
