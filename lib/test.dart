import 'package:flutter/material.dart';

class PreviousActivity extends StatefulWidget {
  @override
  _PreviousActivityState createState() => _PreviousActivityState();
}

class _PreviousActivityState extends State<PreviousActivity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Column(
            children: [
              previousActivityContainer(
                isColor: Colors.black87,
                titleText: 'Ahsan',
                color1: Colors.red,
                color2: Colors.red,
                color3: Colors.green,
                color4: Colors.green,
                color5: Colors.green,
                color6: Colors.green,
                color7: Colors.green,
              ),
              Divider(),

            ],
          )
        ],
      ),
    );
  }

  Widget previousActivityContainer(
      {required Color isColor,
        String,
        titleText,
        required Color color1,
        color2,
        color3,
        color4,
        color5,
        color6,
        color7}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isColor,
      ),
      title: Text(titleText),
      subtitle: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color1, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color2, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color3, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color4, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color5, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color6, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color7, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
        ],
      ),
    );
  }
}
