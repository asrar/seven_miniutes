import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:seven_minutes/oneDayOneRaku/GetMTStockManager.dart';
import 'package:seven_minutes/getlogs/GetLogsManager.dart';
import 'package:seven_minutes/getlogs/GetLogsModel.dart';
import 'package:seven_minutes/model/logsmodel.dart';
import 'package:flutter/material.dart';



import '../../AppLayer/Observer.dart';





class LogsView extends StatefulWidget {
  LogsView({ required this.title}) : super();

  final String title;

  @override
  _LogsViewState createState() => _LogsViewState();
}

class _LogsViewState extends State<LogsView> {
  List ?lessons;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
   // lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GetLogsManager manager = Provider.of(context).fetch(GetLogsManager);

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF3E6EA4),
      //   child: Column(
      //     children: [buildPlayer(),
      //       SizedBox(height: 10),
      //       buildPlay()],
      //   ),
      //   onPressed: () {
      //     // TODO: add the audio controls
      //
      //   //   getAudio();
      //   },
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Observer<List<GetLogsModel>>(
              stream: manager.logsList,
              onSuccess: (context, data) {
                // snapshot.data ?? 0;

                List<GetLogsModel> _productList = data;
                print("printing from list tile");
                GetLogsModel logList = _productList[0];

                return ListView.builder(
                  // for Auto-scrolling binding controller in build method
                    controller: _scrollController,
                    //  reverse: true,
                    shrinkWrap: true,

                    addAutomaticKeepAlives: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _productList[0].data.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("printing from list tile");
                      GetLogsModel _post = _productList[0];



                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(_productList[0].data[index]),
                        ),
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
          ),


        ],
      ),
    );
  }
}
