import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonName;

  CustomButton({required this.buttonName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Container(
        decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: <Color>[Color(0xFF3E6EA4), Color(0xFF21A860)]),
           // color: Colors.green[800],
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),

        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:15.0),
            child: Text(
              buttonName,
              style: TextStyle(color: Colors.white,
              fontFamily: 'Comfortaa',
                letterSpacing: 2,
                fontSize: 12,
                fontWeight: FontWeight.normal
              ),
            ),
          ),
        ),
      ),
    );
  }
}
