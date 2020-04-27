import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to asset flag icon
  String url; // location url for API endpoint
  String isDaytime = ''; // changes based on time

  WorldTime({ this.location, this.flag, this.url });

  String getCurrentImage(now) {
    String imagePath = '';

    if (now.hour >= 19 && now.hour <= 24) {
      imagePath = 'night.jpg';
    } else if(now.hour >= 0 && now.hour < 5) {
      imagePath = 'night.jpg';
    } else if(now.hour >= 5 && now.hour < 7) {
      imagePath = 'dawn.jpg';
    } else if (now.hour >= 7 && now.hour < 10) {
      imagePath = 'latemorning.jpg';
    } else if (now.hour >= 10 && now.hour < 15) {
      imagePath = 'noon.jpg';
    } else if (now.hour >= 15 && now.hour < 17) {
      imagePath = 'earlyeven.jpg';
    } else if (now.hour >= 17 && now.hour < 19)  {
      imagePath = 'lateevening.jpg';
    }

    return imagePath;
  }

  Future<void> getTime() async {
    try {
      // Simulate Network request for username database
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create a datetime obj
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now); // func from intl package
      isDaytime = getCurrentImage(now);
    }
    catch(e) {
      print('caught error: $e');
      time = 'Couldn\'t get time data';
    }
  }
}