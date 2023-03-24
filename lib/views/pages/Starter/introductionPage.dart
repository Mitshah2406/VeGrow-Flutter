import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/views/pages/Starter/popPage.dart';

class IntroScreenPage extends StatelessWidget {
  const IntroScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    DotsDecorator dotsDecorator = DotsDecorator(
        color: Colors.grey.shade500,
        activeColor: Colors.grey.shade800,
        size: const Size(14, 14),
        activeSize: const Size(28, 12),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

    void skipIntro() async {
      var pref = await SharedPreferences.getInstance();
      pref.setBool('show', true);
      // print(pref.getBool('show'));
    }

    return  Scaffold(
            body: IntroductionScreen(
      // For Done Button
      showDoneButton: true,
      done: const Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      onDone: () async {
        skipIntro();
        Get.offNamed('/login');
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

      // globalBackgroundColor: Colors.amber,
      pages: [
        PageViewModel(
            title: "Page 1",
            decoration: PageDecoration(
                // contentMargin: EdgeInsets.all(10),
                imageAlignment: Alignment.center,
                imagePadding: const EdgeInsets.only(top: 200),
                imageFlex: 2,
                // imagePadding: EdgeInsets.only(top: 400),
                titleTextStyle:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(
                  decorationStyle: TextDecorationStyle.dotted,
                  color: Colors.grey.shade500,
                  fontSize: 20,
                )),
            body: "Write down the Description You needed",
            image: Image.asset(
              AppConstant.introPageImg,
              height: 500,
            )),
        PageViewModel(
            title: "Page 2",
            decoration: PageDecoration(
                imageAlignment: Alignment.center,
                imagePadding: const EdgeInsets.only(top: 200),
                imageFlex: 2,
                titleTextStyle:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(
                  decorationStyle: TextDecorationStyle.dotted,
                  color: Colors.grey.shade500,
                  fontSize: 20,
                )),
        ),
        PageViewModel(
          title: "Page 3",
          decoration: PageDecoration(
              imageAlignment: Alignment.center,
              imageFlex: 3,
              imagePadding: const EdgeInsets.only(top: 200),
              titleTextStyle:
                  const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(
                decorationStyle: TextDecorationStyle.dotted,
                color: Colors.grey.shade500,
                fontSize: 20,
              )),
          body: "Write down the Description You needed",
          image: Image.asset(
            AppConstant.introPageImg,
            height: 500,
          ),
        ),
        ],
      )
    );
  }
}
