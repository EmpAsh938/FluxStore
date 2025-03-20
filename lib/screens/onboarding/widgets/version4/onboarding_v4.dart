import 'package:flutter/material.dart';

import '../../onboarding_mixin.dart';

class OnBoardingV4 extends StatefulWidget {
  @override
  _OnboardingPageV4State createState() => _OnboardingPageV4State();
}

class _OnboardingPageV4State extends State<OnBoardingV4> with OnBoardingMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'assets/gif/1.gif',
    'assets/gif/2.gif',
    'assets/gif/3.gif',
  ];

  void _goToNextPage() {
    if (_currentPage < _images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    // Add your logic for finishing the onboarding (e.g., navigate to home screen).
    print("Onboarding Finished!");
    onTapDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEB1B25),
      // appBar: AppBar(
      //   toolbarHeight: 0,
      //   backgroundColor: const Color(0xffEB1B25),
      // ),
      // body:  Image.asset(
      //   _images[0],
      //   // fit: BoxFit.fill,
      // ),
      body: Stack(
        children: [
          // PageView.builder for the GIFs
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                _images[index],
                fit: BoxFit.cover,
              );
            },
          ),
          // Row with buttons at the bottom
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // if (_currentPage < _images.length - 1)
                  TextButton(
                    onPressed: _finishOnboarding,
                    // onPressed: () {
                    //   // Skip to the last page
                    //   _pageController.animateToPage(
                    //     _images.length - 1,
                    //     duration: const Duration(milliseconds: 300),
                    //     curve: Curves.easeInOut,
                    //   );
                    // },
                    child: Text(
                      "Skip".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                // else
                //   const SizedBox(width: 60),
                // Placeholder for alignment
                SizedBox(
                  width: 30,
                ),
                // if (_currentPage < _images.length - 1)
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: TextButton(
                      onPressed: _currentPage < _images.length - 1
                          ? _goToNextPage
                          : _finishOnboarding,
                      child: Text(
                        "Next".toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xffEB1B25),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                // else
                //   ElevatedButton(
                //     onPressed: _finishOnboarding,
                //     style: ButtonStyle(
                //       backgroundColor: WidgetStatePropertyAll(Color(0xffEB1B25),),
                //     ),
                //     child: Text(
                //       "Done".toUpperCase(),
                //       style: const TextStyle(
                //         color: Colors.white,
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   final data = widget.config.items;
//
//   return Scaffold(
//     backgroundColor: Colors.white,
//    body: Image.asset('assets/gif/1.gif'),
//   );
// }
