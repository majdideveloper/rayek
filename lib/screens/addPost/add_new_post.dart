import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';
import 'package:rayek_v001/providers/user_provider.dart';

import '../../models/user.dart';
import '../../utils/utils.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({super.key});

  @override
  State<AddNewPost> createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  File? image;
  var dropdownvalue = 'Selected Category';
  final _controllerQuestion = TextEditingController();
  final _controllerReponces = TextEditingController();

  // function pick image from gallory
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;

      setState(() {
        this.image = File(image.path);
      });
    } on PlatformException catch (e) {
      print('error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
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
            //1STT CHILD SHARE BUTTON
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _controllerQuestion.clear();
                    _controllerReponces.clear();
                    dropdownvalue = 'Selected Category';
                    provider.clearListResponce();
                  });
                },
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    letterSpacing: 1.4,
                    color: BtColor,
                  ),
                ),
              ),
            ),
            // 2SD CHILD PIC AND USER NAME
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

            // 3RD CHILD QUESTION

            TextField(
              textInputAction: TextInputAction.next,
              controller: _controllerQuestion,
              keyboardType: TextInputType.emailAddress,
              style: normalStyle,
              maxLines: 7,
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon

                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),

                // focusedBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(color: BtColor, width: 1.0),
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                fillColor: Colors.grey,

                hintText: "whats in your mind????",

                //make hint text
                hintStyle: smallStyle,
              ),
            ),
            // smallPaddingHor,
            // const Divider(
            //   thickness: 2.0,
            // ),
            smallPaddingHor,
            // 4rd child add pick

            //5rd child category
            // Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text('Tap to chose your Category!')),
            Container(
              //color: Colors.grey.withOpacity(0.2),
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

            InkWell(
              onTap: () => pickImage(),
              child: Row(
                children: [
                  image != null
                      ? Image.file(
                          image!,
                          height: 200,
                          width: 200,
                        )
                      : Icon(Icons.photo, color: BtColor),
                  // Image.asset(
                  //     'assets/images/pic-person-03.jpg',
                  //     height: 100,
                  //     width: 100,
                  //   ),
                  smallPaddingVer,
                  Text('choose image'),
                ],
              ),
            ),
            meduimPaddingHor,
            //6d child answers
            Row(
              children: [
                Icon(
                  Icons.checklist_sharp,
                  color: BtColor,
                ),
                smallPaddingVer,
                Text('Answers : minium 2 answer'),
              ],
            ),

            TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<AppProvider>().addResponce(value);
                  _controllerReponces.clear();
                }
              },
              controller: _controllerReponces,
              keyboardType: TextInputType.emailAddress,
              style: normalStyle,
              maxLines: 1,
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon

                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),

                focusedBorder: OutlineInputBorder(
                    // borderSide: const BorderSide(color: BtColor, width: 1.0),
                    // borderRadius: BorderRadius.circular(10.0),
                    ),
                fillColor: Colors.grey[200],

                hintText: " whats your Answer?",

                //make hint text
                hintStyle: smallStyle,
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.separated(
                    separatorBuilder: (context, index) => smallPaddingHor,
                    itemCount: provider.lengthList,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text((index + 1).toString() +
                            '- ' +
                            provider.getValue(index)),
                        trailing: IconButton(
                          onPressed: () {
                            provider.removeResponce(index);
                          },
                          icon: Icon(
                            Icons.delete_forever_rounded,
                            color: BtColor,
                          ),
                        ),
                      );
                      // return ;
                    })))
          ],
        ),
      ),
    );
  }
}
