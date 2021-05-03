import 'package:flutter/material.dart';

class Config {
  Config._();
  static const BASE_URL = 'https://bntso2--tsodev5.my.salesforce.com';
  static const LANGUAGE_CODE = 'en';
  static const Grant_type = 'password';
  static const Client_Id = '3MVG99E3Ry5mh4zqUIFQhDiKTDEq81eTSckxCqJT.W4gBquUIDoagUdi6b38dcXEec.EEUylVyiFvwmwCLdiF';
  static const Client_Secret = '3541ECD3151E5E871A858D1EC99FF2996B50A3BC1956E43A2A23278134E45867';

  static const error_updating_status = 'Error while updating status';

//username = bookingninjas.tso2@isvedition.org.tsodev5
//password = Targetman9988$ypqrLXFM3io3ozghvWaCq980


}

class MutualActions {



  /*
  static openLink(String url) async {



    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }


  }*/




  static void goToView(var newView , BuildContext context) {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => newView),
    );

  }


  //side_menu

}

