import 'package:flutter/material.dart';
import 'package:rayek_v001/screens/addPost/add_new_post.dart';

import '../screens/addPost/add_post_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/search/search_screen.dart';

class AppProvider with ChangeNotifier {
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
  List<String> _responces = [];
  int get lengthList => _responces.length;

  String getValue(int index) => _responces[index];

  addResponce(String value) {
    _responces.add(value);
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
}
