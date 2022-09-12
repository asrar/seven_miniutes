import 'package:flutter/material.dart';
import 'package:seven_minutes/groupUsers/GroupUsersManager.dart';
import 'package:seven_minutes/groupUsers/UsersGroupModel.dart';

import 'AppLayer/Observer.dart';
import 'AppLayer/Overseer.dart';
import 'AppLayer/Provider.dart';

class CurrentActivity extends StatefulWidget {
  @override
  _CurrentActivityState createState() => _CurrentActivityState();
}

class _CurrentActivityState extends State<CurrentActivity> {
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


                  print("total length ${_post1.Data[0].UserGroups[0].Members.length}");
                  UsersGroupModel _post = _productList[0];
                  print("printing from list tile for lengt ${_post1.Data[0].UserGroups[0].Members[index].lastName}");
                  print("--activities with $index  ${_post.Data[index].activities.day0}");
                  print("done -- data length ${_post.Data.length}");


                  return ListTile(
                      leading: CircleAvatar(backgroundColor: _post.Data[index].activities.day0 == "1"? Colors.green :Colors.red),
                      title: Text("${_post.Data[index].UserGroups[0].Members[index].firstName} ${_post.Data[index].UserGroups[0].Members[index].lastName}"),
                      subtitle: Text("Please Remind him"),
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
}
