import 'package:flutter/material.dart';

class myCard extends StatefulWidget {
  const myCard({super.key});

  @override
  State<myCard> createState() => _myCardState();
}

class _myCardState extends State<myCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Balance",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Hello Farmer',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hello",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const Text("Dataa comes",
                  style: TextStyle(
                    color: Colors.white,
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
