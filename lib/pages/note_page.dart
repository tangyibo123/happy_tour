import 'package:flutter/material.dart';

class NotePage extends StatefulWidget{
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage>{

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Text('攻略'),
        )
    );
    throw UnimplementedError();

  }
}