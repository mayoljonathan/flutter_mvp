import 'package:flutter_mvp/dependency_injection.dart';

import '../../data/repository/auth_repository.dart';
import '../../dependency_injection.dart';
import '../../provider/user_provider.dart';
import 'login_contract.dart';

class LoginPresenter {
  LoginContract _view;
  AuthRepository _repository;
  UserProvider _userProvider;

  LoginPresenter(this._view) {
    _repository = locator<AuthRepository>();
    _userProvider = locator<UserProvider>();
  }

  void login({String username, String password}) async {
    try {
      final user = await _repository.login(username: username, password: password);
      _userProvider.setCurrentUser(user);
      _view.onLoginSuccess();
    } catch (e) {
      print('[LoginPresenter - login]: $e');
      _view.onLoginError(e);
    }
  }
}
