import 'package:cours_app/home/SignUp_screen.dart';
import 'package:cours_app/home/login_screen.dart';
import 'package:cours_app/wedget/wedgetpages..dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<FirstPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    const CustomPage(
      imagePath: 'assets/image/pag1.png',
      title: 'Numerous free\ntrial courses',
      description: 'Free courses for you to\nfind your way to learning',
      backgroundColor: Colors.white,
    ),
    const CustomPage(
      imagePath: 'assets/image/pages2.png',
      title: 'Quick and easy\nlearning',
      description:
          'Easy and fast learning at\nany time to help you\nimprove various skills',
      backgroundColor: Colors.white,
    ),
    const CustomPage(
      imagePath: 'assets/image/page3.png',
      title: 'Create your own\nstudy plan',
      description:
          'study according to the\nstudy plan, make study\nmore motivated',
      backgroundColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _pages,
          ),
          if (_currentPage != _pages.length - 1)
            Positioned(
              top: screenHeight * 0.05, // Adjust top position using percentage
              right:
                  screenWidth * 0.05, // Adjust right position using percentage
              child: TextButton(
                onPressed: () {
                  _pageController.animateToPage(
                    _pages.length - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
              ),
            ),
          Positioned(
            bottom: screenHeight *
                0.3, // Adjust bottom position using percentage to move the buttons higher
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => _buildDot(index),
              ),
            ),
          ),
          if (_currentPage == _pages.length - 1)
            Positioned(
              left: screenWidth * 0.1, // Adjust left position using percentage
              top: screenHeight *
                  0.7, // Adjust top position to move the buttons higher
              height: 200, // Increase height for larger buttons
              width: screenWidth * 0.8, // Adjust width using percentage
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D5CFF),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20), // Increase padding for bigger button
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 15, // Increase font size for bigger button
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ); // Correct GetX navigation
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF3D5CFF),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFF3D5CFF)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20), // Increase padding for bigger button
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15, // Increase font size for bigger button
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
