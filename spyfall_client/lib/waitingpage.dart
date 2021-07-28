import 'package:flutter/material.dart';
import 'connection.dart';

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waiting room'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Center(child: Text('Hosting on ${Connection.gameId}')),
          Center(child: Text('Player ${Connection.username}')),
          Card(
            child: ListTile(
              title: Text("Test option"),
              subtitle: Text("this is a test"),
              trailing: Switch.adaptive(value: false, onChanged: (value) {}),
            ),
          ),
        ],
      ),
    );
  }
}
