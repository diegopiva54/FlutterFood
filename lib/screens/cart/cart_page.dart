import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../widgets/botton_navigator.dart';
import '../../widgets/show_image_cached_network.dart';
import '../../stores/foods.store.dart';
import '../../stores/rastaurant.store.dart';
import '../../models/Food.dart';

class CartScreen extends StatelessWidget {
  FoodsStore _storeFood;
  RestaurantStore _storeRestaurant;

  @override
  Widget build(BuildContext context) {
    _storeFood = Provider.of<FoodsStore>(context);
    _storeRestaurant = Provider.of<RestaurantStore>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Carrinho'),
        centerTitle: true,
      ),
      body: _buildContentCart(context),
      bottomNavigationBar: BottonNavigatorCurved(2),
    );
  }

  Widget _buildContentCart(context) {
    return ListView(
      shrinkWrap: false,
      children: [
        _buildHeader(),
        _buildCartList(context),
        Divider(
          color: Colors.grey[400],
        ),
        _buildTextTotalCart(),
        Divider(
          color: Colors.grey[400],
        ),
        _buildFormeComment(context),
        _buildCheckout(context),
      ],
    );
  }

  ///
  ///Constrói o topo da tela de carrinho
  ///
  Widget _buildHeader() {
    return Observer(
        builder: (context) => Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(16),
              child: Text(
                "Total (${_storeFood.cartItems.length}) Itens",
                style: TextStyle(color: Colors.black),
              ),
            ));
  }

  Widget _buildCartList(context) {
    return Observer(
      builder: (context) => ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _storeFood.cartItems.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> itemCart = _storeFood.cartItems[index];

            return _buildCartItem(itemCart, context);
          }),
    );
  }

  ///
  ///Controi o card do carrinho
  ///
  Widget _buildCartItem(Map<String, dynamic> itemCart, context) {
    final Food food = itemCart['product'];

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey[200]),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            padding: EdgeInsets.all(4),
            child: Row(
              children: [
                ShowImageCachedNetwork(food.image != null
                    ? food.image
                    : 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png'),
                _showDetailItemCart(food, itemCart, context),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              _storeFood.removeFoodCart(food);
            },
            child: Container(
              margin: EdgeInsets.only(top: 2, right: 4),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  ///
  /// Controi o conteudo dentro dos cards
  ///
  Widget _showDetailItemCart(
      Food food, Map<String, dynamic> itemCart, context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // food.name,
              'comida',
              maxLines: 2,
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
            ),
            Container(
              height: 4,
            ),
            Container(
              // color: Colors.black ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ ${food.price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _storeFood.decrementFoodCart(food);
                          },
                          child: Icon(
                            Icons.remove,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          child: Text(
                            itemCart['qty'].toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _storeFood.incrementFoodCart(food);
                            print(food.name);
                          },
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextTotalCart() {
    return Observer(
      builder: (context) => Container(
        margin: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Totais",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Container(height: 5),
            Text(
              "Qtd itens: ${_storeFood.cartItems.length}",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              "Valor total: R\$ ${_storeFood.totalCart.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///Constrói o formulário para comentário
  ///
  Widget _buildFormeComment(context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
      child: TextFormField(
        autocorrect: true,
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        onSaved: (value) {
          print(value);
        },
        decoration: InputDecoration(
          labelText: 'Comentário (ex: sem cebola',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  ///
  ///Construção do botão para finalizar o pedido
  ///
  Widget _buildCheckout(context) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 50, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.orange[800],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 6)
            ]),
        child: RaisedButton(
          onPressed: () => {print('clicou')},
          color: Colors.transparent,
          elevation: 0,
          child: Text(
            'Finalizar Pedido',
            style: TextStyle(fontSize: 16),
          ),
        ));
  }
}
