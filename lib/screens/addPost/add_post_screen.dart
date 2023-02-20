import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';
import 'package:rayek_v001/providers/user_provider.dart';
import 'package:rayek_v001/resources/firestore_methods.dart';

import '../../models/user.dart';
import '../../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? image;
  XFile? tempImg;
  //Uint8List uint8list = Uint8List.fromList(File(path).readAsBytesSync())

  var dropdownvalue = 'Selected Category';
  final _controllerQuestion = TextEditingController();
  final _controllerReponces = TextEditingController();

  // function pick image from gallory
  Future pickImage() async {
    try {
      tempImg = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (tempImg == null) return null;

      setState(() {
        image = File(tempImg!.path);
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
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () async {
                  String res = await FirestoreMethods().uploadQuestion(
                    question: _controllerQuestion.text,
                    file: Uint8List.fromList(
                        File(tempImg!.path).readAsBytesSync()),
                    userId: user.uid,
                    username: user.username,
                    category: dropdownvalue,
                    responses: provider.getListResponses,
                    profImag: user.photoUrl,
                  );
                  if (res == 'success') {
                    showSnackBar(context, "Question posted");
                    setState(() {
                      _controllerQuestion.clear();
                      _controllerReponces.clear();
                      dropdownvalue = 'Selected Category';
                      provider.clearListResponce();
                    });
                  } else {
                    showSnackBar(context, "Question posted");
                  }
                },
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
            InkWell(
              onTap: () => pickImage(),
              child: Row(
                children: [
                  image != null
                      ? Image.file(
                          image!,
                          height: 100,
                          width: 100,
                        )
                      : Image.asset(
                          'assets/images/pic-person-03.jpg',
                          height: 100,
                          width: 100,
                        ),
                  Text('choose your image if you want'),
                ],
              ),
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
            meduimPaddingHor,
            Text('Answers : minium 2 answer'),
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
            SizedBox(
                height: 200,
                child: ListView.separated(
                    separatorBuilder: (context, index) => smallPaddingHor,
                    itemCount: provider.lengthList,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(
                            index.toString() + '- ' + provider.getValue(index)),
                        trailing: IconButton(
                          onPressed: () {
                            provider.removeResponce(index);
                          },
                          icon: Icon(Icons.delete),
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
