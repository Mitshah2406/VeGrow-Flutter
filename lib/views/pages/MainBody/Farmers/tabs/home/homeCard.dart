import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/homeController.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  final HomeController homeController = Get.put(HomeController());

  String greetFarmer() {
    final hour = TimeOfDay.now().hour;

    if (hour <= 12) {
      return "Morning";
    } else if (hour <= 17) {
      return "Afternoon";
    } else if (hour > 17 && hour < 19) {
      return "Evening";
    }
    return "Night";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: card(
        // width: MediaQuery.of(context).size.width - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.black87,
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 25.0,
                          )),
                      onTap: () {},
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good ${greetFarmer().toString()},"),
                    Text(
                      '${homeController.farmerList[0]['fName'].toString()}',
                      style: TextStyle(
                          
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "Bono Nova",
                          color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount Earned',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Oxygen",
                        letterSpacing: 0.2)),
                // SizedBox(width: 52,),
                Text(
                  "5,00,000",
                  style: TextStyle(fontFamily: "Oxygen"),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Successful Bid",
                  style: TextStyle(
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2),
                ),
                SizedBox(
                  width: 60,
                ),
                Text("10")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Transaction",
                  style: TextStyle(
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2),
                ),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.payments, size: 20,)
                )
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "OverAll Ratings",
                  style: TextStyle(
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2),
                ),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.payments, size: 20,)
                )
              ],
            ),
            // SizedBox(height: 10),
            // Text(
            //   '\$2000',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 22,
            //       color: Colors.black38),
            // ),
            // Center(
            //   child: Icon(Icons.keyboard_arrow_down,
            //       size: 30, color: Colors.black45),
            // )
          ],
        ),
      ),
    );
  }
}

Widget card(
    {double width = double.infinity,
    double padding = 20,
    required Widget child}) {
  return Container(
    width: width,
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: child,
  );
}
