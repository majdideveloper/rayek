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
    const ProfileScreen(),
  ];

  int get index => _indexScreen;

  set setIndex(int value) {
    _indexScreen = value;
    notifyListeners();
  }
}