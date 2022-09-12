import 'package:flutter/material.dart';
import 'package:seven_minutes/groupUsers/GroupUsersManager.dart';
import 'package:seven_minutes/groupUsers/UsersGroupModel.dart';

import 'AppLayer/Observer.dart';
import 'AppLayer/Overseer.dart';
import 'AppLayer/Provider.dart';

class PreviousActivity extends StatefulWidget {
  @override
  _PreviousActivityState createState() => _PreviousActivityState();
}

class _PreviousActivityState extends State<PreviousActivity> {
  @override
  Widget build(BuildContext context) {
    GroupUsersManager manager = Provider.of(context).fetch(GroupUsersManager);
    print("- member element's length is ${Overseer.myGroupData.length}");
    return  Column(children: [
      Expanded(
        child: Observer<List<UsersGroupModel>>(
          stream: manager.mainList,
          onSuccess: (context, data) {
            // snapshot.data ?? 0;

            List<UsersGroupModel> _productList = data;
            print("printing from list tile");
            UsersGroupModel _post1 = _productList[0];
            print("yaar this is total number of all group members ${_post1.Data[0].UserGroups[0].Members.length}");

            return ListView.builder(
              // for Auto-scrolling binding controller in build method
              //  reverse: true,
                shrinkWrap: true,

                addAutomaticKeepAlives: true,
                scrollDirection: Axis.vertical,
                itemCount: _post1.Data[0].UserGroups[0].Members.length,
                itemBuilder: (BuildContext context, int index) {
                  print("printing from list tile length ${_productList.length}");
                  UsersGroupModel _post = _productList[0];
                print(" day 5 of index[ ${index} ] is ${_post.Data[index].activities.day0}");
                  return  previousActivityContainer(
                    isColor: _post.Data[index].activities.day0 == 0.toString() ? Colors.red : Colors.green,
                    titleText: '${_post.Data[index].firstName}  ${_post.Data[index].lastName}',
                    color1: _post.Data[index].activities.day0 == 0.toString() ? Colors.red : Colors.green,
                    color2: _post.Data[index].activities.day1 == 0.toString() ? Colors.red : Colors.green,
                    color3: _post.Data[index].activities.day2 == 0.toString() ? Colors.red : Colors.green,
                    color4: _post.Data[index].activities.day3 == 0.toString() ? Colors.red : Colors.green,
                    color5: _post.Data[index].activities.day4 == 0.toString() ? Colors.red : Colors.green,
                    color6: _post.Data[index].activities.day5 == 0.toString() ? Colors.red : Colors.green,
                    color7: _post.Data[index].activities.day6 == 0.toString() ? Colors.red : Colors.green,

                  );

                });
          },
          onWaiting: (context) {
            return Center(child: CircularProgressIndicator());
          },
          onError: (context, error) {
            print("printing error");
            print(error);
            return Center(child: Text("Please Check Internet!"));
          },
        ),
      )],
    );
  }

  // Padding(
  // padding: const EdgeInsets.all(8.0),
  // child: ListView.builder(
  // itemCount: Overseer.myGroupData.first.UserGroups[0].Members.length,
  // itemBuilder: (BuildContext context, int index) {
  // print("printing from list tile");
  // // GetPosts _post = _productList[0];
  //
  // return ListTile(
  // leading: CircleAvatar(backgroundColor: Overseer.myGroupData[index].activities.day0 == "1"? Colors.green :Colors.red),
  // title: Text("${Overseer.myGroupData.first.UserGroups[0].Members[index].firstName} ${Overseer.myGroupData.first.UserGroups[0].Members[index].lastName}"),
  // subtitle: Text("Please Remind him"),
  // );;
  // }),
  // );

  Widget currentActivityContainer(
      {String, titleText, required String sub, required Color isColor}) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: isColor),
      title: Text(titleText),
      subtitle: Text(sub),
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
