import 'package:flutter/material.dart';

class CategorieWidgts extends StatelessWidget {
  const CategorieWidgts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SizedBox(
            // width: double.infinity,
            child: GridView.count(
              //scrollDirection: Axis.horizontal,
              primary: false,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 6,
              children: const [
                CatgorieConainer(
                  icon: Icon(Icons.all_inclusive),
                  textIcon: "All",
                ),
                CatgorieConainer(
                  icon: Icon(Icons.sports_esports),
                  textIcon: "Sport",
                ),
                CatgorieConainer(
                  icon: Icon(Icons.palette_rounded),
                  textIcon: "art",
                ),
                CatgorieConainer(
                  icon: Icon(Icons.south_america_outlined),
                  textIcon: "social",
                ),
                CatgorieConainer(
                  icon: Icon(Icons.business_rounded),
                  textIcon: "Business",
                ),
                CatgorieConainer(
                  icon: Icon(Icons.school_rounded),
                  textIcon: "Schools",
                ),
              ],
            ),
          ),
        ),
      ],
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
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(width: 0.7, color: Colors.blue),
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
