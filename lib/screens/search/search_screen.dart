import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rayek_v001/screens/auth/auth.dart';
import 'package:rayek_v001/screens/profile/profile_screen.dart';
import 'package:rayek_v001/utils/utils.dart';
import 'package:rayek_v001/widgets/custom_button.dart';

import '../../models/user.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controllerSearch = TextEditingController();
  List<Map<String, dynamic>> data = [];
  String textSearch = '';

  addData() {
    for (var element in data) {
      FirebaseFirestore.instance.collection("users").add(element);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
              controller: _controllerSearch,
              onChanged: (value) {
                setState(() {
                  textSearch = value;
                });
              },
              keyboardType: TextInputType.text,
              style: const TextStyle(
                fontSize: 24,
                color: DarkText,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: BtColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,

                hintText: "search.....",

                //make hint text
                hintStyle: normalStyle,
              )),

          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: ((context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Flexible(
                        child: ListView.separated(
                        separatorBuilder: ((context, index) => smallPaddingHor),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          UserModel user =
                              UserModel.fromSnap(snapshot.data!.docs[index]);

                          if (textSearch.isEmpty) {
                            return InkWell(
                              onTap: () {
                                goTo(
                                    context,
                                    ProfileScreen(
                                      user: UserModel.fromSnap(
                                          snapshot.data!.docs[index]),
                                    ));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(user.photoUrl),
                                ),
                                title: Text(user.username),
                                subtitle: Text(user.email),
                              ),
                            );
                          }
                          if (user.username
                              .toLowerCase()
                              .startsWith(textSearch.toLowerCase())) {
                            return InkWell(
                              onTap: () {
                                goTo(
                                    context,
                                    ProfileScreen(
                                      user: UserModel.fromSnap(
                                          snapshot.data!.docs[index]),
                                    ));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(user.photoUrl),
                                ),
                                title: Text(user.username),
                                subtitle: Text(user.email),
                              ),
                            );
                          }
                          return SizedBox();
                        }),
                      ));
              }))

          //list Users
        ],
      ),
    );
  }
}
