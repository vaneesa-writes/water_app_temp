import 'package:flutter/material.dart';

const ReusableContainerColor = Color(0xFFb15b2e);

class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.displayText, required this.value});
  String displayText;
  double value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              displayText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              value.toStringAsFixed(2),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 5,
      width: (MediaQuery.of(context).size.width / (3.5)),
      margin: EdgeInsets.fromLTRB(10, 0, 4, 2),
    );
  }
}
