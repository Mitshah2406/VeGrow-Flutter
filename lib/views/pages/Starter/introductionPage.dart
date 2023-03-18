import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/pages/Authentication/welcome.dart';

class IntroScreenPage extends StatelessWidget {
  const IntroScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DotsDecorator dotsDecorator = DotsDecorator(
        color: Colors.grey.shade500,
        activeColor: Colors.grey.shade800,
        size: const Size(14, 14),
        activeSize: const Size(28, 12),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

    return Scaffold(
        body: IntroductionScreen(
      // For Done Button
      showDoneButton: true,
      done: const Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      onDone: () {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) {
          return Welcome();
        }));
      },

      // For Next Button
      showNextButton: true,
      next: const Icon(
        Icons.arrow_forward,
        size: 30,
      ),

      // For Skip Button
      showSkipButton: true,
      skip: const Text(
        "Skip",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),

      // For Dots
      dotsDecorator: dotsDecorator,

      pages: [
        PageViewModel(
          title: "Page 1",
          body: "",
          image: Center(
              child: Image.asset(
            AppConstant.introPageImg,
            width: 350,
            height: 300,
          )),
        ),
        PageViewModel(title: "Page 1", body: "This is Op"),
        PageViewModel(
            title: "Page 1",
            body: "This is Op",
            footer: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  // Navigator.pushReplacement(context,
                  //     CupertinoPageRoute(builder: (context) {
                  //   return login();
                  // }));
                  Get.toNamed('/welcome');
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )))
      ],
    ));
  }
}