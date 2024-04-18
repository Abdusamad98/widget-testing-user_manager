import 'package:flutter/material.dart';
import 'package:user_manager/utils/source_enum.dart';

import 'user.dart';

class DatabaseViewModel extends ChangeNotifier {
  List<User> activeUsers = [];
  List<User> archivedUsers = [];

//Creates new user and adds to activeUsers
  Future<void> addNewUser(User user) async{
    activeUsers.add(user);
    notifyListeners();
  }

//Moves user from active to achived
  void moveToArchived(User user) {
    archivedUsers.add(user);
    activeUsers.remove(user);
    notifyListeners();
  }

//Moves user from archived to active
  void moveToActive(User user) {
    activeUsers.add(user);
    archivedUsers.remove(user);
    notifyListeners();
  }

//Deletes user from database
  bool deleteUser({required User user, required Source source}) {
    switch (source) {
      case Source.active:
        activeUsers.remove(user);
        notifyListeners();
        return true;
      case Source.archived:
        archivedUsers.remove(user);
        notifyListeners();
        return true;
    }
  }
}