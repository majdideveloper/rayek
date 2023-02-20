import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rayek_v001/utils/utils.dart';

class CategorieWidgts extends StatelessWidget {
  const CategorieWidgts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> _mapCategory = [
      {
        "icon": Icon(Icons.all_inclusive),
        "textIcon": "all",
      },
      {"icon": Icon(Icons.sports_esports), "textIcon": "sport"},
      {"icon": Icon(Icons.palette_rounded), "textIcon": "art"},
      {"icon": Icon(Icons.south_america_outlined), "textIcon": "social"},
      {"icon": Icon(Icons.business_rounded), "textIcon": "Business"},
      {"icon": Icon(Icons.school_rounded), "textIcon": "school"},
    ];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: _mapCategory.length,
          separatorBuilder: (context, index) {
            return smallPaddingVer;
          },
          itemBuilder: (context, index) {
            return CatgorieConainer(
              icon: _mapCategory[index]["icon"] as Icon,
              textIcon: _mapCategory[index]["textIcon"] as String,
            );
          },
          scrollDirection: Axis.horizontal,
          // children: [
          //   CatgorieConainer(
          //     icon: Icon(Icons.all_inclusive),
          //     textIcon: "All",
          //   ),
          //   smallPaddingVer,
          //   CatgorieConainer(
          //     icon: Icon(Icons.sports_esports),
          //     textIcon: "Sport",
          //   ),
          //   CatgorieConainer(
          //     icon: Icon(Icons.palette_rounded),
          //     textIcon: "art",
          //   ),
          //   CatgorieConainer(
          //     icon: Icon(Icons.south_america_outlined),
          //     textIcon: "social",
          //   ),
          //   CatgorieConainer(
          //     icon: Icon(Icons.business_rounded),
          //     textIcon: "Business",
          //   ),
          //   CatgorieConainer(
          //     icon: Icon(Icons.school_rounded),
          //     textIcon: "Schools",
          //   ),
          // ],
        ),
      ),
    );
  }
}

class CatgorieConainer extends StatelessWidget {
  final Icon icon;
  final String textIcon;
  const CatgorieConainer({
    Key? key,
    required this.icon,
    required this.textIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(width: 02, color: BtColor),
        borderRadius: BorderRadius.circular(20),
      ),
      //color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: icon,
              //Icon(Icons.add_a_photo_rounded),
              //color: BtColor,
              // iconSize: 20,
            ),
            Text(textIcon),
          ],
        ),
      ),
    );
  }
}
