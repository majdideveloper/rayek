import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/user_provider.dart';

import '../../models/user.dart';
import '../../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  var dropdownvalue = 'Selected Category';
  final _controllerQuestion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserProvider>().getUser;

    List<String> items = [
      'Selected Category',
      'Sport',
      'Art',
      'Social',
      'Business',
      "School"
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Share'),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(user.photoUrl),
              ),
              title: Text(
                user.username,
                style: boldTitleStyle,
              ),
            ),
            smallPaddingHor,
            TextField(
              textInputAction: TextInputAction.next,
              controller: _controllerQuestion,
              keyboardType: TextInputType.emailAddress,
              style: normalStyle,
              maxLines: 3,
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: BtColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,

                hintText: "whats in your mind????",

                //make hint text
                hintStyle: normalStyle,
              ),
            ),
            smallPaddingHor,
            const Divider(
              thickness: 3.0,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/pic-person-03.jpg',
                  height: 100,
                  width: 100,
                ),
                Text('choose your image if you want'),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('choose your Category')),
            Container(
              color: Colors.grey.withOpacity(0.2),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  // Down Arrow Icon
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      print(dropdownvalue);
                    });
                  },
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('write your first option')),
            TextField(
              textInputAction: TextInputAction.next,
              controller: _controllerQuestion,
              keyboardType: TextInputType.emailAddress,
              style: normalStyle,
              maxLines: 1,
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: BtColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,

                hintText: "whats in your mind????",

                //make hint text
                hintStyle: normalStyle,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('write your second option')),
            TextField(
              textInputAction: TextInputAction.next,
              controller: _controllerQuestion,
              keyboardType: TextInputType.emailAddress,
              style: normalStyle,
              maxLines: 1,
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: BtColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,

                hintText: "option 1 maybe Yes",

                //make hint text
                hintStyle: normalStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
