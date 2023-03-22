import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class buttonRow extends StatefulWidget {
  const buttonRow({super.key});

  @override
  State<buttonRow> createState() => _buttonRowState();
}

class _buttonRowState extends State<buttonRow> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/star.png'),
              SizedBox(
                height: 5,
              ),
              Text(
                "5.4",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Vendor".tr),
              Text("Rating".tr)
            ],
          ),
        ),
        VerticalDivider(
          color: Theme.of(context).dividerColor,
          thickness: 1,
          indent: 40,
          endIndent: 30,
        ),
        MaterialButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/box-truck.png'),
              SizedBox(
                height: 5,
              ),
              Text(
                "5.4",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 3,
              ),
              Text("Transactions".tr),
              Text("completed".tr)
            ],
          ),
        ),
        VerticalDivider(
          color: Theme.of(context).dividerColor,
          thickness: 1,
          indent: 40,
          endIndent: 30,
        ),
        MaterialButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/handshake.png'),
              SizedBox(
                height: 5,
              ),
              Text(
                "5.4",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 3,
              ),
              Text("Vendors".tr),
              Text("Connected".tr)
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildButton(BuildContext context, String value, String text,
      {String text2 = ""}) {
    var button = MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.fire_truck),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 3,
          ),
          Text(text),
          text2 == "" ? Text('') : Text(text2),
        ],
      ),
    );
    return button;
  }
}
