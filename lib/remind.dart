import 'package:flutter/material.dart';

import 'model_remind.dart';

class Remind extends StatefulWidget {
  @override
  _RemindState createState() => _RemindState();
}

class _RemindState extends State<Remind> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: nameReminder.length,
        itemBuilder: (context, i) => box(
          nameReminder[i].title,
          nameReminder[i].date,
          nameReminder[i]
              .nameList
              .map((e) => container(text: e.name, isReceived: e.isActive))
              .toList(),
        ),
      ),
    );
  }

  Widget box(String title, DateTime date, List<Widget> children) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
            Text(
              date.toString(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            ...children
          ],
        ));
  }

  Widget container({required String text, required bool isReceived}) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: isReceived ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.green)),
            child: Container(
              height: 30,
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "",
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              margin: EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
          ),
          if (!isReceived)
            Container(
              width: 140,
              height: 40,
              padding: const EdgeInsets.all(8),
              child: TextButton(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //     side: BorderSide(color: Colors.green.withOpacity(0.5))),
                // textColor: Colors.white,
                // color: Colors.green[500],
                child: Text('Notification'),
                onPressed: () {},
              ),
            )
        ],
      ),
    );
  }
}
