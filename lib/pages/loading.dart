import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = 'Loading....';
  void setupWorldTime() async {
    WorldTime wt = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await wt.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : wt.location,
      'flag' : wt.flag,
      'time' : wt.time,
      'isDayTime' : wt.isDayTime
    });

    /*
    print(wt.time);
    setState(() {
      time = wt.time;
    });
     */
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}

