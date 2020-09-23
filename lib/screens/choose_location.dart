import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: "America/Argentina/Buenos_Aires",
        location: "Argentina",
        flag: "argentina.png"),
    WorldTime(
        url: "Australia/Sydney", location: "Australia", flag: "australia.png"),
    WorldTime(
        url: "Asia/Dhaka", location: "Bangladesh", flag: "bangladesh.png"),
    WorldTime(url: "America/Toronto", location: "Canada", flag: "canada.png"),
    WorldTime(url: "Asia/Shanghai", location: "China", flag: "china.png"),
    WorldTime(
        url: "Asia/Jakarta", location: "Indonesia", flag: "indonesia.png"),
    WorldTime(
        url: "Africa/Johannesburg",
        location: "South Africa",
        flag: "south-africa.png"),
    WorldTime(url: "Europe/Madrid", location: "Spain", flag: "spain.png"),
    WorldTime(
        url: "Europe/London",
        location: "United Kingdom",
        flag: "united-kingdom.png"),
    WorldTime(
        url: "America/New_York",
        location: "United States",
        flag: "united-states.png"),
  ];

  void updateLocation(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateLocation(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/flags/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
