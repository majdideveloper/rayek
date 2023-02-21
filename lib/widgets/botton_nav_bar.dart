import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        child: Icon(Icons.sort_rounded),
        closedForegroundColor: Colors.black,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.black,
        //  labelsStyle: /* Your label TextStyle goes here */,
        labelsBackgroundColor: Colors.white,
        /* Your custom animation controller goes here */
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: Icon(Icons.home),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            label: 'Let\'s go to home!',
            onPressed: () {},
            closeSpeedDialOnPressed: false,
          ),
          SpeedDialChild(
            child: Icon(Icons.search),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            label: 'search!',
            onPressed: () {},
            closeSpeedDialOnPressed: false,
          ),

          SpeedDialChild(
            child: Icon(Icons.person),
            foregroundColor: Colors.white,
            backgroundColor: Colors.pink,
            label: 'Let\'s go to profile!',
            onPressed: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.design_services),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue[900],
            label: 'Let\'s write a post!',
            onPressed: () {},
          ),
          //  Your other SpeedDialChildren go here.
        ],
      ),
    );
  }
}
