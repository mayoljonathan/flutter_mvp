import '../../core/exceptions/exceptions.dart';

abstract class LoginContract {
  void onLoginSuccess();
  void onLoginError(Failure failure);
}
