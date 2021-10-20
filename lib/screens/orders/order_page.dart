import 'package:flutter/material.dart';
import 'package:flutter_food/stores/orders.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_circular_progress_indicator.dart';
import '../../widgets/botton_navigator.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {
  OrdersStore _storeOrders;

  @override
  Widget build(BuildContext context) {
    _storeOrders = Provider.of<OrdersStore>(context);
    _storeOrders.getMyOrders();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Meus Pedidos'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Observer(
        builder: (context) => _buildOrderScreen(context),
      ),
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
        _storeOrders.isLoading
            ? CustomCircularProgressIndicator(textLabel: 'Carregando...')
            : _buildOrdersList(context),
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
        itemCount: this._storeOrders.orders.length,
        itemBuilder: (BuildContext context, int index) {
          final Order order = this._storeOrders.orders[index];

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
        "Data ${order.date_created}",
        style: TextStyle(color: Colors.grey),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.navigate_next),
      ),
      onTap: () {
        print(order.identify);
        Navigator.pushNamed(context, '/details-order', arguments: order);
      },
    );
  }
}
