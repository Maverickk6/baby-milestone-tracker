import 'package:baby_milestones_tracker/screens/home_screen.dart';
import 'package:baby_milestones_tracker/screens/onboarding.dart';
import 'package:baby_milestones_tracker/screens/pre_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 105, 123, 238),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const PreOnboardingView(),
        'onboarding': (context) => const OnboardScreen(),
        'home': (context) => const HomeScreen()
      },
      // home: Container(),
    );
  }
}
