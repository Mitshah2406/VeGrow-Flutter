// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListProduceSkeleton extends StatelessWidget {
  final double? height;
  
  final double? width;

   ListProduceSkeleton({
    Key? key,
     this.height,
     this.width,
  }) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.04),
          borderRadius: BorderRadius.all(Radius.circular(16))),
    );
  }
}
