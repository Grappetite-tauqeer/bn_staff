import 'package:bn_staff/core/colors.dart';
import 'package:bn_staff/model/room.dart';
import 'package:bn_staff/widgets/PButton.dart';
import 'package:flutter/material.dart';

class ReportAddInfo extends StatelessWidget {
  final Room selectedRoom;

  ReportAddInfo({this.selectedRoom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.selectedRoom.name),
        backgroundColor: PColors.blue,
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Report A problem', //background: rgba(79, 85, 102, 1);
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: PColors.lightBlack,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                TextField(
                  decoration: InputDecoration(
                        hintText: 'Please enter a search term' ,
                        hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 3, //Normal textInputField will be displayed
                  maxLines: 10
                  , // when user presses enter it will adapt to it
                ),
                SizedBox(
                  height: 24
                  ,
                ),
                PButton(
                  title: 'REPORT',
                  action: () {

                  },
                ),

                //border: 1px solid rgba(229, 229, 229, 1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
