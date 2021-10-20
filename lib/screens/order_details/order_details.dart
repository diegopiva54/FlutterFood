import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/botton_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../widgets/food_card.dart';
import '../../models/Evaluation.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order _order;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    _order = settings.arguments;
    print(_order.comment);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Detalhes do Pedido"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: _buildOrderDetails(context),
      ),
      bottomNavigationBar: BottonNavigatorCurved(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _makeTextOrder('Pedido', _order.identify),
          _makeTextOrder('Data', _order.date_created),
          _makeTextOrder('Status', _order.status),
          _makeTextOrder('Valor Total', _order.total.toString()),
          _order.comment != null
              ? _makeTextOrder('Comentário', _order.comment)
              : Container(),
          Divider(
            color: Colors.grey[400],
            height: 40,
          ),
          Text(
            'Produtos',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(height: 20),
          _buildFoodsOrder(context),
          Divider(
            color: Colors.grey[400],
            height: 40,
          ),
          Text(
            'Avaliações',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          _buildEvaluationsOrder(context),
        ],
      ),
    );
  }

  Widget _makeTextOrder(String textLabel, String textValue) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Text(
            textLabel + ': ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            textValue,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodsOrder(context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _order.foods.length,
      itemBuilder: (context, index) {
        final Food food = _order.foods[index];

        return FoodCard(
          food: food,
          NotShowIconCart: true,
        );
      },
    );
  }

  Widget _buildEvaluationsOrder(context) {
    return _order.evaluations.length > 0
        ? Container(
            padding: EdgeInsets.only(top: 20, bottom: 50),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _order.evaluations.length,
              itemBuilder: (context, index) {
                final Evaluation evaluation = _order.evaluations[index];

                return this._buildEvaluationItem(evaluation, context);
              },
            ),
          )
        : Container(
            height: 40,
            margin: EdgeInsets.only(top: 20, bottom: 30),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/evaluation-order',
                    arguments: _order.identify);
              },
              color: Colors.orange[700],
              elevation: 2.2,
              child: Text('Avaliar o Pedido'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.orangeAccent),
              ),
            ),
          );
  }

  Widget _buildEvaluationItem(Evaluation evaluation, context) {
    return Card(
      elevation: 2.5,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: evaluation.stars,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              unratedColor: Colors.grey[300],
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: null,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "${evaluation.user.name} - ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    evaluation.comment,
                    // 'teste',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
