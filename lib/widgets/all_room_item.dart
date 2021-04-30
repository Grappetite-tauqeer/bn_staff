import 'package:bn_staff/model/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class AllRoomsItem extends StatefulWidget {
  final bool isClean;

  final Room room;

  AllRoomsItem({this.room,this.isClean = true});

  @override
  _AllRoomsItemState createState() => _AllRoomsItemState();
}

class _AllRoomsItemState extends State<AllRoomsItem> {
  var cleanColor = Color.fromRGBO(38, 192, 198, 1);
  var reportedColor = Colors.red;
  var ratioForStatus = 24;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Card(
        child: Container(
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: 3,
                child: Container(
                  color: cleanColor,
                ),
              ),
              Expanded(
                flex: ratioForStatus,
                child: Center(
                  child: Container(
                    child: Text(
                      widget.room.roomStatus == RoomStatus.cleaned ? 'Clean' : 'Reported',
                      style: TextStyle(color:
                      widget.room.roomStatus == RoomStatus.cleaned ? cleanColor : reportedColor ,
                        fontWeight: FontWeight.w600 ,
                        fontSize: 14
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              Expanded(
                flex: 100 - ratioForStatus,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(this.widget.room.name),
                        SizedBox(height: 4,),
                        Text(this.widget.room.roomType),

                      ],
                    ),
                  ),
                ),
              ),
              Icon(Icons.navigate_next),
              SizedBox(width: 8),

            ],
          ),
        ),
      ),
      actions: [
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {

          },
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: (){

          },
        ),
      ],
    );
  }
}
