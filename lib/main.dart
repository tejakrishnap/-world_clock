import 'package:flutter/material.dart';
import 'package:worldclock/pages/choose_location.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/', // initial route will be the starting screen of the app
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  },
));

