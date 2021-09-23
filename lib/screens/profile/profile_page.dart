import 'package:flutter/material.dart';
import 'package:flutter_food/widgets/botton_navigator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildProfileScreen(context),
      bottomNavigationBar: BottonNavigatorCurved(3),
    );
  }

  Widget _buildProfileScreen(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAvatarUser(),
          Container(height: 30),
          _buildTextUser(context),
          Container(height: 10),
          _buildButtonLogout(context),
        ],
      ),
    );
  }

  Widget _buildAvatarUser() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: CircleAvatar(
        maxRadius: 60,
      ),
    );
  }

  Widget _buildTextUser(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Diego Henrique Piva',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'diego_pivanp@hotmail.com',
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildButtonLogout(context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          print('Saiu');
        },
        color: Colors.red,
        elevation: 2.2,
        child: Text('Sair'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
