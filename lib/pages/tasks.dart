import 'package:bn_staff/core/colors.dart';
import 'package:bn_staff/model/room.dart';
import 'package:bn_staff/model/user.dart';
import 'package:bn_staff/pages/rooms_to_clean.dart';
import 'package:bn_staff/util/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'all_rooms.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int _sliding = 0;

  RoomList list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    EasyLoading.show(
      status: 'loading...',
    );

    RoomApiProvider().getRooms(successCallBack: (result) {

      setState(() {
        list = result;
      });
      EasyLoading.dismiss();

      return;

    }, failedCallBack: () {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: PColors.blue,
          title: Text('Tasks'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: CupertinoSlidingSegmentedControl(
                    children: {
                      0: Text('Rooms To Clean'),
                      1: Text('All Rooms'),
                    },
                    groupValue: _sliding,
                    onValueChanged: (newValue) {
                      setState(() {
                        _sliding = newValue;
                      });
                    }),
              ),
              Expanded(
                child: this.list == null ? Container() : AllRooms(roomList: this.list,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}