import 'package:flutter/material.dart';

import '../screens/addPost/add_post_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/search/search_screen.dart';

class AppProvider with ChangeNotifier {
  int _indexScreen = 0;

  final List<Widget> listScreen = [
    const HomeScreen(),
    const SearchScreen(),
    const AddPostScreen(),
    ProfileScreen(),
  ];

  int get index => _indexScreen;

  set setIndex(int value) {
    _indexScreen = value;
    notifyListeners();
  }

  //list for responces user
  List<Map<String, int>> _responces = [];

  List get getListResponses => _responces;
  int get lengthList => _responces.length;

  String getValue(int index) =>
      _responces[index].toString().split(":")[0].substring(1);

  addResponce(String value) {
    _responces.add({value: 0});
    notifyListeners();
  }

  removeResponce(int index) {
    _responces.remove(index);
    notifyListeners();
  }

  clearListResponce() {
    _responces.clear();
    notifyListeners();
  }
}
