import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/bidController.dart';

class BidDropDown extends StatefulWidget {
  const BidDropDown({super.key});

  @override
  State<BidDropDown> createState() => _BidDropDownState();
}

class _BidDropDownState extends State<BidDropDown> {
  BidController bidController=Get.find();
 @override
  Widget build(BuildContext context) {
   return Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTileCard(
              baseColor: Colors.cyan[50],
              expandedColor: Colors.red[50],
              // key: cardA,
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT64brhmOqm7mxP2nO8o61MXs18VHKK9Czy_g&usqp=CAU"),
                backgroundColor: Colors.white,
              ),
              title: Text("widget.influencerData['infFirstName']"),
              children: [
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Email: " ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: [
                    ElevatedButton(
   style: ElevatedButton.styleFrom(
   backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      // onPressed: () {
   ),
                      //   cardA.currentState?.expand();
                      // },
                      onPressed: () {
                        print("hiiii");
                      },
                      child: Column(
                        children: [
                          Icon(Icons.phone),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Call'),
                        ],
                      ),
                    ),
                    ElevatedButton(
               style: ElevatedButton.styleFrom(
   
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                      // onPressed: () {
   
                      // onPressed: () {
                      //   cardA.currentState?.expand();
                      // },
                      onPressed: () async {
                      
                      },
                      child: Column(
                        children: [
                          Icon(Icons.add),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('WhatsApp'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                     style: ElevatedButton.styleFrom(
   
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      // onPressed: () {
                     ),
                      // onPressed: () {
                      //   cardA.currentState?.collapse();
                      // },
                      onPressed: () {
                     
                        // Navigator.pushNamed(context, "/");
                      },
                      child: Column(
                        children: [
                          Icon(Icons.add),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('ADD PF'),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(4.0)),
                    //   onPressed: () {},
                    //   child: Column(
                    //     children: <Widget>[
                    //       Icon(Icons.swap_vert),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(vertical: 2.0),
                    //       ),
                    //       Text('Toggle'),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
}