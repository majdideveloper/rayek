import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class BottomBarNav extends StatelessWidget {
  const BottomBarNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return SpeedDial(
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
          // label: 'Let\'s go to home!',
          onPressed: () {
            provider.setIndex = 0;
          },
          closeSpeedDialOnPressed: true,
        ),
        SpeedDialChild(
          child: Icon(Icons.search),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          // label: 'search!',
          onPressed: () {
            provider.setIndex = 1;
          },
          closeSpeedDialOnPressed: true,
        ),

        SpeedDialChild(
          child: Icon(Icons.person),
          foregroundColor: Colors.white,
          backgroundColor: Colors.pink,
          // label: 'Let\'s go to profile!',
          onPressed: () {
            provider.setIndex = 3;
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.design_services),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
          // label: 'Let\'s write a post!',
          onPressed: () {
            provider.setIndex = 2;
          },
        ),
        //  Your other SpeedDialChildren go here.
      ],
    );
  }
}

class SpeedDialMenu extends StatelessWidget {
  const SpeedDialMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return SpeedDialMenuButton(
      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: false,
      mainFABPosX: 15,
      mainFABPosY: 15,
      isSpeedDialFABsMini: false,
      paddingBtwSpeedDialButton: 10.0,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
      },
      //general init
      isMainFABMini: true,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          mini: false,
          child: Icon(Icons.menu),
          onPressed: () {},
          closeMenuChild: Icon(Icons.close),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: Colors.red),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.home),
          onPressed: () {
            //if need to close menu after click
            provider.setIndex = 0;
          },
          backgroundColor: Colors.pink,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(
            Icons.search,
            size: 28,
          ),
          onPressed: () {
            provider.setIndex = 1;
            //if need to close menu after click
          },
          backgroundColor: Colors.pink,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.edit),
          onPressed: () {
            provider.setIndex = 2;
            //if need to toggle menu after click
          },
          backgroundColor: Colors.orange,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.person),
          onPressed: () {
            provider.setIndex = 3;
            //if no need to change the menu status
          },
          backgroundColor: Colors.deepPurple,
        ),
      ],
    );
  }
}
