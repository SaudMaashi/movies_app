import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/splash_screen.dart';
import 'package:movies_app/utilities/constants.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF303030),
          primarySwatch: kPrimaryColor,
          fontFamily: GoogleFonts.inriaSansTextTheme().bodyMedium!.fontFamily,
          brightness: Brightness.dark,
          useMaterial3: false),
    );
  }
}
