import 'package:flutter/material.dart';
import 'package:flutter_world_time/pages/location_display.dart';
import 'package:flutter_world_time/pages/choose_location.dart';
import 'package:flutter_world_time/pages/splash_screen.dart';
import 'package:flutter_world_time/pages/home.dart';
import 'package:flutter_world_time/pages/signup.dart';
import 'package:flutter_world_time/pages/device_list.dart';
import 'pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
        '/' : (Context) => SplashScreen(),
      '/locationdisplay' : (Context) => LocationDisplay(),
      '/homenew' : (Context) => Home(),
      '/login' : (Context) => LoginPage(),
      '/signup' : (Context) => SignupPage(),
      '/devicelist' : (Context) => DeviceList(),
      '/location' : (Context) => ChooseLocation()
    },
  ));
}
