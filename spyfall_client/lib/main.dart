import 'package:flutter/material.dart';
import 'homepage.dart';
import 'connection.dart';

void main() {
  Connection.connectAndListen();
  return runApp(MaterialApp(
    home: SpyfallApp(),
  ));
}

class SpyfallApp extends StatefulWidget {
  @override
  _SpyfallAppState createState() => _SpyfallAppState();
}

class _SpyfallAppState extends State<SpyfallApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spyfall'),
        backgroundColor: Colors.red,
      ),
      body: HomePage(),
    );
  }
}
