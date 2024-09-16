import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/utilities/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnboardingScreenWidget extends StatelessWidget {
  final String text;
  final int step;
  final bool isButton;
  const OnboardingScreenWidget({
    super.key,
    required this.text,
    required this.step,
    required this.isButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                              TextSpan(text: "You"),
                              TextSpan(
                                  text: "Watch",
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
            Builder(
              builder: (context) {
                if (step == 3) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Start your journey",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ));
                }
                return const Text("");
              },
            ),
            const Spacer(),
            StepProgressIndicator(
                totalSteps: 3, currentStep: step, selectedColor: kPrimaryColor),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
