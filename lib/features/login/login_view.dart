import 'package:flutter/material.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/utils/dialog_helper.dart';
import '../../core/utils/validators.dart';
import '../../router/routes.dart';
import 'login_contract.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginContract {
  LoginPresenter _presenter;

  _LoginPageState() {
    _presenter = LoginPresenter(this);
  }

  bool _isLoading = false;
  bool _autovalidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          autovalidate: _autovalidate,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) => Validator([
                  Validators().isRequired(value, 'Please enter your username'),
                  Validators().minLength(value, 6, 'Your username must be at least 6 characters'),
                ]).exec(),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) => Validator([
                  Validators().isRequired(value, 'Please enter your password'),
                  Validators().minLength(value, 6, 'Your password must be at least 6 characters'),
                ]).exec(),
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      onPressed: _doLogin,
                      child: Text('Login'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(Failure e) {
    setState(() => _isLoading = false);
    DialogHelper.showAlertDialog(context, message: e.message);
  }

  @override
  void onLoginSuccess() {
    setState(() => _isLoading = false);
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  void _doLogin() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() => _isLoading = true);

      _presenter.login(
        username: _usernameController.text,
        password: _passwordController.text,
      );
    } else {
      setState(() => _autovalidate = true);
    }
  }
}
