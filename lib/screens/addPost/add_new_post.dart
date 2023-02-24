import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';
import 'package:rayek_v001/providers/user_provider.dart';

import '../../models/user.dart';
import '../../resources/firestore_methods.dart';
import '../../utils/utils.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({super.key});

  @override
  State<AddNewPost> createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  XFile? tempImg;
  var dropdownvalue = 'Selected Category';
  final _controllerQuestion = TextEditingController();
  final _controllerReponces = TextEditingController();
  bool _isLoading = false;

  // function pick image from gallory
  Future pickImage() async {
    try {
      tempImg = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (tempImg == null) return tempImg;
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
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                //1STT CHILD SHARE BUTTON
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () async {
                      if (_controllerQuestion.text.length > 10 &&
                          provider.lengthList >= 2 &&
                          dropdownvalue != 'Selected Category' &&
                          tempImg != null) {
                        // setState(() {
                        //   _isLoading = true;
                        // });
                        showLoadingDialog(context,
                            'https://lottie.host/3fbe4e60-14cc-4792-9e41-e927020b3ee2/BKmG5z7oRW.json');
                        // 'https://assets7.lottiefiles.com/packages/lf20_qqu8eybe.json'
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
                          Navigator.pop(context);
                          //showSnackBar(context, "Question posted");
                          provider.setIndex = 0;
                          setState(() {
                            _controllerQuestion.clear();
                            _controllerReponces.clear();
                            dropdownvalue = 'Selected Category';
                            provider.clearListResponce();
                            XFile? fileNull;
                            provider.setImage = fileNull;
                          });
                        } else {
                          // setState(() {
                          //   _isLoading = false;
                          // });
                          Navigator.pop(context);
                          showSnackBar(context, "Question Not posted");
                        }
                      } else {
                        alertDialog(context,
                            "Please make sure your question is at least 10 letters long and includes a selected category with a minimum of two possible answers. \n Thank you for your attention to this matter. Please revise your question accordingly.");
                      }
                    },
                    child: const Text(
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
                  cursorColor: BtColor,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: BtColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: LightText)),

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

                //4rd child category
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

                smallPaddingHor,
                // 5d child add pick image
                InkWell(
                  onTap: () async {
                    await pickImage();
                    if (tempImg != null)
                      provider.setImage = tempImg!;
                    else
                      provider.setImage = tempImg;
                  },
                  child: Row(
                    children: [
                      provider.getImage != null
                          ? Image.file(
                              File(provider.getImage!.path),
                              height: 200,
                              width: 200,
                            )
                          : Icon(Icons.photo, color: BtColor),
                      smallPaddingVer,
                      const Text('choose image'),
                    ],
                  ),
                ),
                meduimPaddingHor,
                //6d child answers
                Row(
                  children: const [
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
                  cursorColor: BtColor,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: BtColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: LightText)),
                    hintText: " whats your Answer?",
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
                                print(provider.getListResponses);
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
          _isLoading
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
