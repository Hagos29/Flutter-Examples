// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Asmara', flag: 'Eritrea.png', url: 'Africa/Asmara');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location':instance.location,
     'flag':instance.flag,
     'url':instance.url,
     'time':instance.time,
     'isDaytime':instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body:Center(
          child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
),
        ), 
    );
  }
}
