import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import './widgets/heading_auth.dart';
import '../../stores/auth.store.dart';

class LoginScreen extends StatelessWidget {
  double _deviceWidth;
  double _deviceHeight;

  AuthStore _authStore;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Observer(
            builder: (context) => _loginPageUI(context),
          ),
        ));
  }

  Widget _loginPageUI(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      child: Column(
        children: <Widget>[
          Container(height: 50),
          new HeadingAuth(),
          Container(height: 20),
          _formLogin(context),
          Container(height: 30),
          _loginButton(context),
          Container(height: 10),
          _textRegister(context),
        ],
      ),
    );
  }

  Widget _formLogin(context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .6),
                blurRadius: 20.0,
                offset: Offset(0, 10))
          ]),
      child: Column(
        children: <Widget>[
          _emailTextField(context),
          _passwordTextField(context),
        ],
      ),
    );
  }

  Widget _emailTextField(context) {
    return TextFormField(
      controller: _email,
      autocorrect: false,
      // autofocus: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          contentPadding: EdgeInsets.all(10),
          hintText: 'E-mail',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _passwordTextField(context) {
    return TextFormField(
      controller: _password,
      autocorrect: false,
      // autofocus: true,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: 'Senha',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {
          _authStore.isLoading ? null : _auth(context);
          // Navigator.pushReplacementNamed(context, '/restaurants');
        },
        color: Theme.of(context).primaryColor,
        child: Text(_authStore.isLoading ? 'Entrando' : 'ENTRAR '),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => new RegisterScreen()));
        Navigator.pushNamed(context, '/register');
      },
      child: Text(
        'Cadastrar-se',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15),
      ),
    );
  }

  Future _auth(context) async {
    await _authStore.auth(_email.text, _password.text);

    Navigator.pushReplacementNamed(context, '/restaurants');
  }
}
