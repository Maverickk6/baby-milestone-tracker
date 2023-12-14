import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          
          globalBackgroundColor: const Color.fromARGB(255, 222, 221, 239),
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: const Text(
                "Simple",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              bodyWidget: const Text(
                "Track and keep records of your child's growth",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              image: SvgPicture.asset(
                'assets/baby.svg',
                height: 200,
                width: 200,
              ),
            ),
            PageViewModel(
              titleWidget: const Text(
                "Concise",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              bodyWidget: const Text(
                "Your wishlist for your child at a glance",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              image: SvgPicture.asset(
                'assets/mother.svg',
                height: 200,
                width: 200,
              ),
            ),
            PageViewModel(
              titleWidget: const Text(
                "Informative",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              bodyWidget: const Text(
                "Track and keep records of your child's growth",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              image: SvgPicture.asset(
                'assets/father.svg',
                height: 200,
                width: 200,
              ),
            ),
          ],
          onDone: () {
            Navigator.pushNamed(context, 'home');
          },
          onSkip: () {
            Navigator.pushNamed(context, 'home');
          },
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          done: const Text(
            'Done',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black,
            activeColor: Colors.blue,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
