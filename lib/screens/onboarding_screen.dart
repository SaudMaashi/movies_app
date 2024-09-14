import 'package:flutter/material.dart';
import 'package:movies_app/utilities/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "You",
                    style: TextStyle(color: Colors.red, fontSize: 50),
                  ),
                  TextSpan(
                    text: "Watch",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              "Version 1.1.0",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
