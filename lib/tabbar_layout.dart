import 'package:flutter/material.dart';
import 'package:seven_minutes/JoinGroup/JoinGroup.dart';
import 'package:seven_minutes/current_activity.dart';
import 'package:seven_minutes/groupUsers/GroupUsersManager.dart';
import 'package:seven_minutes/groupUsers/UsersGroupModel.dart';
import 'package:seven_minutes/previous_activity.dart';
import 'package:seven_minutes/remind.dart';
import 'package:seven_minutes/settings.dart';

import 'AppLayer/Overseer.dart';
import 'AppLayer/Provider.dart';


class TabbarLayout extends StatefulWidget {
  @override
  _TabbarLayoutState createState() => _TabbarLayoutState();
}

class _TabbarLayoutState extends State<TabbarLayout>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3E6EA4),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Group Activity",
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
            SizedBox(height: 1,),
            Text(
              "Group Id: ${Overseer.groupUniqueId}",
              style: TextStyle(color: Colors.amber, fontSize: 15.0),
            )
          ],
        ),




        centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        bottom: TabBar(
          indicatorColor: Color(0xFF3E6EA4),

          isScrollable: true,
          controller: tabController,
          tabs: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Tab(
                child: Text(
                  'Today',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Tab(
                child: Text(
                  'Last 7 days',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [CurrentActivity(), PreviousActivity()],
      ),
    );
  }
}
