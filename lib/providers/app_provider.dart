import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayek_v001/screens/addPost/add_new_post.dart';

import '../screens/addPost/add_post_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/search/search_screen.dart';

class AppProvider with ChangeNotifier {
  // image post
  XFile? _image;

  XFile? get getImage => _image;

  set setImage(XFile? img) {
    _image = img;
    notifyListeners();
  }

  //indexBottom bar
  int _indexScreen = 0;

  final List<Widget> listScreen = [
    const HomeScreen(),
    const SearchScreen(),
    const AddNewPost(),
    //const AddPostScreen(),
    ProfileScreen(),
  ];

  int get index => _indexScreen;

  set setIndex(int value) {
    _indexScreen = value;
    notifyListeners();
  }

  //list for responces user
  final List<Map<String, dynamic>> _responces = [];

  List get getListResponses => _responces;
  int get lengthList => _responces.length;

  String getValue(int index) =>
      _responces[index].toString().split(":")[0].substring(1);

  addResponce(String value) {
    _responces.add({"id": lengthList, "reponse": value, "votes": 0});
    notifyListeners();
  }

  removeResponce(int index) {
    _responces.removeAt(index);
    notifyListeners();
  }

  clearListResponce() {
    _responces.clear();
    notifyListeners();
  }

  //list responses update
  List _updateResponses = [];
  set addData(List list) {
    _updateResponses = list;
    notifyListeners();
  }

  updateData(int index) {
    _updateResponses[index]["votes"] += 1;
    notifyListeners();
  }

  get getDataList => _updateResponses;
}
