import 'package:flutter/material.dart';

class PreOnboardingView extends StatelessWidget {
  const PreOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, 'onboarding');
    });
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 200),
            Column(
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 20,),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Baby MileStone Tracker!',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                'The ultimate platform for parents to track their children\'s growth.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
