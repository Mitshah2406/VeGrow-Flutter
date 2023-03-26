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
      done:  Icon(Icons.arrow_forward_ios),
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
            title: "Welcome",
            
            decoration: PageDecoration(
                // contentMargin: EdgeInsets.all(10),
                imageAlignment: Alignment.center,
                imagePadding: const EdgeInsets.only(top: 200),
                imageFlex: 2,
                // imagePadding: EdgeInsets.only(top: 400),
                titleTextStyle:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Bono Nova'),
                bodyTextStyle: TextStyle(
                  decorationStyle: TextDecorationStyle.dotted,
                  color: Colors.grey.shade500,
                  fontFamily: "Oxygen",
                  letterSpacing: 0.3,
                  fontSize: 20,
                )),
            body: "VeGrow provides a ecosystem between farmer & vendors",
           
            image: Image.asset(
              AppConstant.introPageImg,
              height: 500,
            )),
        PageViewModel(
            image: Image.asset(
              AppConstant.introPageImg,
              height: 500,
            ),
            title: "Farmers",
            body: "Farmers can list their produce to sell and also reach out to multiple vendors",
            decoration: PageDecoration(
                imageAlignment: Alignment.center,
                imagePadding: const EdgeInsets.only(top: 200),
                imageFlex: 2,
                titleTextStyle:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Bono Nova'),
                bodyTextStyle: TextStyle(
                  decorationStyle: TextDecorationStyle.dotted,
                  color: Colors.grey.shade500,
                  fontSize: 20,
                  fontFamily: 'Oxygen'
                )),
        ),
        PageViewModel(
          title: "Vendors",
          decoration: PageDecoration(
              imageAlignment: Alignment.center,
              imageFlex: 2,
              imagePadding: const EdgeInsets.only(top: 200),
              titleTextStyle:
                  const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: "Bono Nova"),
              bodyTextStyle: TextStyle(
                decorationStyle: TextDecorationStyle.dotted,
                color: Colors.grey.shade500,
                fontFamily: 'Oxygen',
                fontSize: 20,
              )),
          body: "Vendors can bid and buy adequate amount of products at a fair price",
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
