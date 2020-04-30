import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; // data we receive from location route

    // set background Image
    String bgImage = data['isDaytime'];
    Color bgColor = (
      data['isDaytime'] == 'dawn-min.jpg' ||
      data['isDaytime'] == 'latemorning-min.jpg' ||
      data['isDaytime'] == 'noon-min.jpg' ||
      data['isDaytime'] == 'earlyeven-min.jpg'
    ) ? Colors.deepOrange[300] : Colors.lime[400];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 6.0,
                        color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 66.0,
                      fontFamily: 'Orbitron',
                      color: Colors.white,
                      letterSpacing: 3.0,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 60.0),
                FlatButton.icon(
                    color: Colors.black,
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: bgColor,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                          color: bgColor
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
