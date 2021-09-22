import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowImageCachedNetwork extends StatelessWidget {
  String image = '';

  ShowImageCachedNetwork(this.image);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      // child: Image.asset('assets/images/IconeFlutterFood.png'),
      child: CachedNetworkImage(
        height: 30, //remover após colocar imagen correta
        imageUrl: this.image,
        placeholder: (context, url) => Container(
          height: 80,
          width: 80,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
