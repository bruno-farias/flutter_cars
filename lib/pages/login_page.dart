import 'package:flutter/material.dart';
import 'package:flutter_cars/domain/services/login_service.dart';
import 'package:flutter_cars/pages/home.dart';
import 'package:flutter_cars/utils/alerts.dart';
import 'package:flutter_cars/utils/nav.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _body(context),
      ),
    );
  }

  String _validateEmail(String text) {
    if (text.isEmpty) {
      return 'Please inform your email';
    }
    return null;
  }

  String _validatePassword(String text) {
    if (text.isEmpty) {
      return 'Please inform your password';
    }
    return null;
  }

  Widget _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            validator: _validateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black, fontSize: 24.0),
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.black)),
            style: TextStyle(color: Colors.grey, fontSize: 18.0),
          ),
          TextFormField(
            controller: passwordController,
            validator: _validatePassword,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black, fontSize: 24.0),
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.black)),
            style: TextStyle(color: Colors.grey, fontSize: 18.0),
          ),
          Container(
              height: 70.0,
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  _onClickLogin(context);
                },
                child: _progress
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    : Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
              ))
        ],
      ),
    );
  }

  void _onClickLogin(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;
    if (!_formKey.currentState.validate()) {
      return null;
    }

    setState(() {
      _progress = true;
    });

    final response = await LoginService.login(email, password);

    if (response.isOk()) {
      pushReplacement(context, Home());
    } else {
      alert(context, 'Error', response.msg);
    }

    setState(() {
      _progress = false;
    });
  }
}
