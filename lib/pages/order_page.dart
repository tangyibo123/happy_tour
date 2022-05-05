import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget{
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>{

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Text('订单'),
        )
    );
    throw UnimplementedError();

  }
}