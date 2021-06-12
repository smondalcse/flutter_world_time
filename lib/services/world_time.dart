import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location, time, flag, url;
  bool? isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      // network request
      Response response = await get(Uri.parse('http://www.worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now  = DateTime.parse(datetime);
      now  = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour <20 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (ex) {
      print(ex);
      time = 'Exception happen';
    }

  }

}