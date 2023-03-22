import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class optionsCard extends StatefulWidget {
  const optionsCard({super.key});

  @override
  State<optionsCard> createState() => _optionsCardState();
}

class _optionsCardState extends State<optionsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 500, 20, 0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(children: [SizedBox(height: 15  ), 
        ListTile(
          leading: Icon(
            Icons.monetization_on,
            color: Theme.of(context).primaryColor,  
          ),
          title: Text(
            "Outstanding Transactions",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {},
          ) ,
        ),
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          leading: Icon(
            Icons.monetization_on,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "My Reviews",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {},
          ),
        ),
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
         ListTile(
          leading: Icon(
            Icons.monetization_on,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "My Reviews",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {},
          ),
        ), 
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),       ListTile(
          leading: Icon(
            CupertinoIcons.globe,  
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "Languages",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),subtitle: Text("English"),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {},
          ),
        ), 
        Divider(
          color: Theme.of(context).dividerColor,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
      ]),
    );
  }
}
