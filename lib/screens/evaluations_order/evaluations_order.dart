import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/botton_navigator.dart';

class EvaluationOrderScreen extends StatelessWidget {
  const EvaluationOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar o pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreenEvaluationOrder(context),
      bottomNavigationBar: BottonNavigatorCurved(1),
    );
  }

  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [_buildHeader(context), _buildFormEvaluation(context)],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: Text(
        "Avaliar o Pedido: #135415f4a",
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  ///
  ///Constrói a coluna e chama os campos de estrelas e text field de avaliação
  ///
  Widget _buildFormEvaluation(context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          _buildRatingBar(context),
          _buildFormTextField(context),
          _buildButton(),
        ],
      ),
    );
  }

  ///
  ///Constrói a barra de estrelas de avaliação
  ///
  Widget _buildRatingBar(context) {
    return RatingBar.builder(
      initialRating: 2,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 50,
      unratedColor: Colors.grey[300],
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (value) => {print(value)},
    );
  }

  ///
  ///Constrói o text field do campo avaliação
  ///
  Widget _buildFormTextField(context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
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

  _buildButton() {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: RaisedButton(
        onPressed: () {
          print('avaliado');
        },
        color: Colors.orange[700],
        elevation: 2.2,
        child: Text('Enviar Avaliação',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
