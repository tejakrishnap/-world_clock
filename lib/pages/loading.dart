import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      // sending required data through routing
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    }); // pushReplacementNamed won't keep the loading page under the home after routing
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('Loading ...'),
      ),
    );
  }
}
