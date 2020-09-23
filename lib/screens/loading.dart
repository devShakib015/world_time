import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(flag: 'bangladesh.png', location: "Dhaka", url: "Asia/Dhaka");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitDualRing(
          color: Colors.white,
          size: 50.0,
        ),
        SizedBox(height: 50),
        Text("Shakib's First Flutter App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 2,
            ))
      ],
    ));
  }
}
