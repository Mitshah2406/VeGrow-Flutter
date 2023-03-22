import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProduceTile extends StatelessWidget {
  String image;
  String foodName;
  String price;

  ProduceTile({required this.foodName, required this.price, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade500,
              spreadRadius: 3,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
          child: InkWell(
            onTap: () {
              List Data = [
                {"heroTag": image, "foodName": foodName, "foodPrice": price.toString()}
              ];
              Get.toNamed('/singleProducePage', arguments: Data);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Hero(
                        transitionOnUserGestures: true,
                        tag: image,
                        child: Image(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                          height: 100.0,
                          width: 100.0
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            foodName,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            price.toString(),
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              color: Colors.grey
                            )
                          )
                        ]
                      )
                    ]
                  )
                ),
                Container(height: 100, color: Colors.grey, width: 1.0),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: const Text(
                        "Price: \$20",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.4
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.redAccent.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.redAccent.shade700,
                            spreadRadius: 2
                          )
                        ]
                      ),
                      child: const Text(
                        "Not Sold",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        ),
    );
  }
}