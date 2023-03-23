import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/pages/Starter/popPage.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popPage(
        page: Scaffold(
      backgroundColor: AppConstant.bgColorAuth,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         ClipOval(
    child: Image.asset(
        AppConstant.illustration1,
        fit: BoxFit.cover,
        width: 250,
    ),
),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Let's Get Started..",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Never a better time than no to start!",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ),
          SizedBox(
            height: 38,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Get.offNamed('/login');
              },
            style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              
              child: Padding(

                padding: const EdgeInsets.all(16.0),
                child: Text("Get Started",
                style: TextStyle(fontSize: 16),),
              )),
          ),
          // GestureDetector(
          //   onTap: () async {
          //     var pref = await SharedPreferences.getInstance();
          //     pref.setBool('show', false);
          //     print('Done');
          //   },
          //   child: const Text("Revert", style: TextStyle(fontSize: 20),),
          // ),
        ]),
      )),
    ));
  }
}














// WillPopScope(
//       child: Scaffold(
//         // appBar: AppBar(
//         //   actions: [
//         //    IconButton(
//         //     onPressed: (){
//         //       print(Get.isDarkMode);
//         //       Get.isDarkMode ? Get.changeTheme(ThemeData.light()) : Get.changeTheme(ThemeData.dark());
//         //     },
//         //     icon: const Icon(Icons.lightbulb)
//         //     )
//         //   ]
//         // ),
//         backgroundColor: AppConstant.bgColorAuth,
//         body: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//             Image.asset(
//               AppConstant.illustration1,
//               width: 250,
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             const Text(
//               "Let's Get Started..",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text("Never a better time than no to start!",
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black38),
//             ),
//             const SizedBox(
//               height: 38,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: (){
//                   Get.offNamed('/login');
//                 },
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                   backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text("Get Started",
//                   style: TextStyle(fontSize: 16),),
//                 )),
//             ),
//             // GestureDetector(
//             //   onTap: () async {
//             //     var pref = await SharedPreferences.getInstance();
//             //     pref.setBool('show', false);
//             //     print('Done');
//             //   },
//             //   child: const Text("Revert", style: TextStyle(fontSize: 20),),
//             // ),
//           ]),
//         )),
//       ),
//       
//     );