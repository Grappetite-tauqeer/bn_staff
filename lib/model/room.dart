
class RoomList {

  List<Room> list;

  RoomList.fromJson(List<dynamic> orderList) {

    list =
        (orderList as List).map((e) => Room.fromJson(e)).toList();

  }

}


class Room {
  String id;
  String name;
  RoomStatus roomStatus;
  int roomId;
  String roomType;

  Room.fromJson(Map<String, dynamic> json) {

    id = json['Id'];
    name = json['Name'];
    if (json['Status__c'] == 'Clean') {
      roomStatus = RoomStatus.cleaned;
    } else {
      roomStatus = RoomStatus.reported;
    }
    var c = json['attributes'];
    roomType = json['attributes']['type'];
    print(roomType);

  }
}

enum RoomStatus { toDo, cleaned, reported }
