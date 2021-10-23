import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../stores/auth.store.dart';
import 'package:flutter_food/widgets/botton_navigator.dart';

class ProfileScreen extends StatelessWidget {
  AuthStore _authStore;

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Meu Perfil'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildProfileScreen(context),
      bottomNavigationBar: BottonNavigatorCurved(3),
    );
  }

  Widget _buildProfileScreen(context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAvatarUser(),
            Container(height: 30),
            _buildTextUser(context),
            Container(height: 10),
            _buildButtonLogout(context),
            Container(height: 10),
            Divider(
              color: Colors.grey[300],
            ),
            _buildCardAdress(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarUser() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          print('clicou');
        },
        child: CircleAvatar(
          maxRadius: 60,
        ),
      ),
    );
  }

  Widget _buildTextUser(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _authStore.user.name,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          _authStore.user.email,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildButtonLogout(context) {
    return Container(
      child: RaisedButton(
        onPressed: () => _authStore.isLoading ? null : _logout(context),
        color: Colors.red,
        elevation: 2.2,
        child: Text(_authStore.isLoading ? 'Saindo...' : 'Sair'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildCardAdress() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Endereço de Entrega',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _buildAddress(),
          _buildButtonEditAddress(),
        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Rua: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Rua Dom João Quarto, 60',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[500]),
          Row(
            children: [
              Text(
                'Bairro: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Floresta',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[500]),
          Row(
            children: [
              Text(
                'Complemento: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Em frente aos Correios',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[500]),
          Row(
            children: [
              Text(
                'Cep: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '68.193-000',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[500]),
          Row(
            children: [
              Text(
                'Cidade: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Novo Progresso',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonEditAddress() {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: RaisedButton(
        onPressed: () {
          print('Alterar meu endereço');
        },
        color: Colors.grey[800],
        elevation: 2.2,
        child: Text('Alterar Endereço'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Future _logout(context) async {
    await _authStore.logout();

    Navigator.pushReplacementNamed(context, '/login');
  }
}
