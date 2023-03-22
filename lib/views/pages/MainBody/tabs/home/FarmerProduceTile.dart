import 'package:flutter/material.dart';

class FarmerProduceTile extends StatelessWidget {
  final String imagePath;
  final String produceTitle;
  final String produceDescription;

  const FarmerProduceTile({
    required this.imagePath,
    required this.produceTitle,
    required this.produceDescription
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(12.0),
          color: Colors.grey.shade200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    child: Image.asset(imagePath),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.green.shade400,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "Hello",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                  )
                ]
              ),
              Text(produceTitle),
              Text(produceDescription)
            ]
          )
        ),
      ),
    );
  }
}