import 'dart:convert';

import 'package:bn_staff/core/constants.dart';
import 'package:bn_staff/model/room.dart';
import 'package:bn_staff/model/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:dio/dio.dart';

final Dio _dio = Dio();

final String _endpoint = Config.BASE_URL;

class LoginApiProvider {
  Future<void> getUser(String username, String password,
      {Function successCallBack, Function failedCallBack}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var url = _endpoint + '/services/oauth2/token';

      var formData = FormData.fromMap({
        'grant_type': Config.Grant_type,
        'client_id': Config.Client_Id,
        'client_secret': Config.Client_Secret,
        'username': username,
        'password': password,
      });

      Response response = await _dio.post(url, data: formData);

      var user = User.fromJson(response.data, username, password);
      // var json = jsonEncode(user.toJson());

      var json = jsonEncode(user.toJson());
      prefs.setString('user', json);

      print(response.data);

      successCallBack.call();

      return;

      /*
      {
    "access_token": "00D0n0000004jZf!ARgAQDdyJgfPTpxDSQfQX_.1UhISayWNUe63VxJP6ENhCI2b4jmOtIMAKN1W0eQBIRZm5SBG8cOelY5jN6wUDI2Fyx9J993K",
    "instance_url": "https://bntso2--tsodev5.my.salesforce.com",
    "id": "https://test.salesforce.com/id/00D0n0000004jZfEAI/0056A000000pWk0QAE",
    "token_type": "Bearer",
    "issued_at": "1619629753570",
    "signature": "XzWpUwQmmPVM+Rgv4+vU44sEspt2Sjoesfa/C2g6PpQ="
}
      * */
      // return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");

      failedCallBack.call();

      //return UserResponse.withError("$error");
    }
  }
}

class RoomApiProvider {
  Future<void> getRooms({Function successCallBack(result), Function failedCallBack}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var url = _endpoint + '/services/apexrest/StaffAppUnitAPI/v1/';



      User currentUser = await User.getCurrentUser();


      _dio.options.headers['Authorization'] = 'Bearer '+currentUser.accessToken;


      Response response = await _dio.get(
        url,
      );

      var rooms = RoomList.fromJson(response.data);

      successCallBack(rooms);

    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");

      failedCallBack.call();

      //return UserResponse.withError("$error");
    }
  }
}
