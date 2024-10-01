import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../registration/registration_page.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) => OnboardContent(
                  image: contents[index].image,
                  title: contents[index].title,
                  description: contents[index].description,
                  pageController: _pageController,
                  count: contents.length,
                  currentPageIndex: currentIndex,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({required this.image, required this.title, required this.description});
}

final List<Onboard> contents = [
  Onboard(
    image: 'images/img.png',
    title: 'Check Restaurant Status',
    description:
    'Find out which restaurants are open or closed at any moment. Never miss a meal or a snack with live updates.',
  ),
  Onboard(
    image: 'images/img_1.png',
    title: 'Browse Menus On-the-Go',
    description:
    'Explore the full menu of your favorite spots. Whether you\'re craving a quick bite or a full meal, see what’s cooking before you head out.',
  ),
  Onboard(
    image: 'images/img_2.png',
    title: 'Your Culinary Journey',
    description:
    'Dive in and make the most of your campus dining experience. Let’s get started!',
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pageController,
    required this.count,
    required this.currentPageIndex,
  });

  final String image, title, description;
  final PageController pageController;
  final int count;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 220),
        Image.asset(image, height: 250),
        SizedBox(height: 75),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff1F2937),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff4B5563),
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff4B5563),
                ),
              ),
            ),
            SizedBox(width: 80,),
            SmoothPageIndicator(
              controller: pageController,
              count: count,
              effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Color(0xff32B768),
                dotColor: Color(0xffD1D5DB),
              ),
            ),
            SizedBox(width: 89,),
            GestureDetector(
              onTap: (){
                if (currentPageIndex < count - 1) {
                  pageController.animateToPage(
                    currentPageIndex + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                }
              },
              child: Icon(Icons.arrow_forward,
                size: 34,
                color: Color(0xff32B768),
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
