import 'package:flutter_mvp/core/exceptions/exceptions.dart';

import '../../data/repository/auth_repository.dart';
import '../../dependency_injection.dart';
import 'login_contract.dart';

class LoginPresenter {
  LoginContract _view;
  AuthRepository _repository;

  LoginPresenter(this._view) {
    _repository = Injector().authRepository;
  }

  void login({String username, String password}) async {
    try {
      await _repository.login(username: username, password: password);
      _view.onLoginSuccess();
    } catch (e) {
      print('[LoginPresenter - login]: $e');
      _view.onLoginError(e);
    }
  }
}
