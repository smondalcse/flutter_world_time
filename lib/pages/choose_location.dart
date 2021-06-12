import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong_Kong', flag: 'hongkong.jpg'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'bangkok.jpg'),
    WorldTime(url: 'Asia/Dhaka', location: 'Bangladesh', flag: 'bangladesh.png'),
    WorldTime(url: 'Asia/Dili', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'qatar.jpg'),
    WorldTime(url: 'Europe/London', location: 'England', flag: 'england.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.jpg'),
    WorldTime(url: 'Europe/Dublin', location: 'Ireland', flag: 'ireland.jpg'),
    WorldTime(url: 'Europe/Istanbul', location: 'Turkey', flag: 'turkey.jpg'),
  ];

  void updateTime(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    // print(wt.location);
    // print(wt.url);
    Navigator.pop(context, {
      'location' : wt.location,
      'flag' : wt.flag,
      'time' : wt.time,
      'isDayTime' : wt.isDayTime
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build is run');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Location Chose'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location.toString()),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
