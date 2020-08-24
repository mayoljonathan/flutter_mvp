import 'package:flutter/foundation.dart';

import '../data/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _currentUser;
  User get currentUser => _currentUser;
  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }
}
