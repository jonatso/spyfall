import 'package:flutter/material.dart';
import 'connection.dart';
import 'waitingpage.dart';

class HostPage extends StatefulWidget {
  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  final playerNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    playerNameController.dispose();
    super.dispose();
  }

  void pushWaitingPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WaitingPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Host game'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: playerNameController,
              decoration: InputDecoration(
                labelText: "Player name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Host!',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
              onPressed: () async {
                Connection.hostGame(playerNameController.text);
                await Future.delayed(Duration(seconds: 1));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WaitingPage(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
