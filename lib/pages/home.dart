import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
     data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = (data as dynamic)['isDaytime'] ? 'day.jpg' : 'night.jpG';
    Color bgColor =
        (data as dynamic)['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.amberAccent,
                  ),
                  label: const Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      //add as dynamic
                      (data as dynamic)['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 1.0,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 46.0,
                    color: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
