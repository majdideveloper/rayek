import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';

import 'package:rayek_v001/widgets/botton_nav_bar.dart';

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

        floatingActionButton: SpeedDialMenu(),
        // bottomNavigationBar: Consumer<AppProvider>(
        //   builder: (_, provider, __) => BottomNavigationBar(
        //       backgroundColor: DarkText,
        //       onTap: (index) => provider.setIndex = index,
        //       currentIndex: provider.index,
        //       selectedItemColor: BtColor,
        //       unselectedItemColor: HLightText,
        //       type: BottomNavigationBarType.fixed,
        //       items: const [
        //         BottomNavigationBarItem(
        //             icon: Icon(
        //               Icons.home,
        //               size: 30,
        //             ),
        //             label: ""),
        //         BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        //         BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
        //         BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        //       ]),
        // ),
      ),
    );
  }
}
