import 'package:flutter/material.dart';

class AppInfoBox extends StatelessWidget {
  final Color color;
  final String? title;
  // final double amount;
  final double amount;
  
  const AppInfoBox({ 
    Key? key, 
    this.title,
    required this.amount,
    this.color = Colors.grey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)

      ),
      width: width * 0.4,
      height: height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? ""
          ),
          Text(
            '$amount',
            style: TextStyle(
              fontSize: 50
            ),
          ),
        ],
      ),
      // child: 
    );
  }
}