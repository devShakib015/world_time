import 'package:http/http.dart';
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    // request the time api
    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map timeData = jsonDecode(response.body);

    String dateTime = timeData['datetime'];
    String offset = timeData['utc_offset'].substring(0, 3);

    DateTime now = DateTime.parse(dateTime);
    DateTime currentTime = now.add(Duration(hours: int.parse(offset)));

    isDaytime = currentTime.hour > 6 && currentTime.hour < 19 ? true : false;

    time = DateFormat.jm().format(currentTime);
  }
}
