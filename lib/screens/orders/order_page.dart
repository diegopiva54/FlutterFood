import 'package:flutter/material.dart';

import '../../widgets/botton_navigator.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {
  List<Order> _orders = [
    new Order(date: '30/02/2021', identify: 'fadfadaf'),
    new Order(date: '30/02/2021', identify: 'fadcac'),
    new Order(date: '30/02/2021', identify: 'fadffaffadaf'),
    new Order(date: '30/02/2021', identify: 'afafafaf'),
    new Order(date: '30/02/2021', identify: 'fafdfaf'),
    new Order(date: '30/02/2021', identify: 'fafaacas'),
    new Order(date: '30/02/2021', identify: 'dqsdaca'),
    new Order(date: '30/02/2021', identify: 'cadfadca'),
    new Order(date: '30/02/2021', identify: 'fqfacasf'),
    new Order(date: '30/02/2021', identify: 'cacasafaf'),
    new Order(date: '30/02/2021', identify: 'avbadfg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderScreen(context),
      bottomNavigationBar: BottonNavigatorCurved(1),
    );
  }

  ///
  ///Construtor dos elementos do body
  ///
  Widget _buildOrderScreen(context) {
    return Column(
      children: [
        _buildHeader(),
        Divider(
          color: Colors.grey[400],
        ),
        _buildOrdersList(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Text(
        'Meus Pedidos',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildOrdersList(context) {
    return Expanded(
      child: ListView.builder(
        itemCount: this._orders.length,
        itemBuilder: (BuildContext context, int index) {
          final Order order = this._orders[index];

          return _buildItemOrder(order, context);
        },
      ),
    );
  }

  Widget _buildItemOrder(Order order, context) {
    return ListTile(
      title: Text(
        "Pedido #${order.identify}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(
        "Data #${order.date}",
        style: TextStyle(color: Colors.grey),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.navigate_next),
      ),
      onTap: () {
        print(order.identify);
        Navigator.pushNamed(context, '/details-order');
      },
    );
  }
}
