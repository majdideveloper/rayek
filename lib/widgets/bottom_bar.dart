import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';

import 'package:rayek_v001/screens/home/home_screen.dart';
import 'package:rayek_v001/screens/profile/profile_screen.dart';

import '../screens/addPost/add_post_screen.dart';
import '../screens/search/search_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Provider.of<AppProvider>(context, listen :false)and Provider.of<AppProvider>(context, listen: true)
        //context.read<AppProvider>() and context.watch<AppProvider>()
        body: Provider.of<AppProvider>(context, listen: true)
            .listScreen[context.read<AppProvider>().index],
        bottomNavigationBar: Consumer<AppProvider>(
          builder: (_, provider, __) => BottomNavigationBar(
              onTap: (index) => provider.setIndex = index,
              currentIndex: provider.index,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.percent_rounded), label: ""),
              ]),
        ),
      ),
    );
  }
}
