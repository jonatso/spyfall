import 'package:flutter/material.dart';
import 'joinpage.dart';
import 'hostpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
                'Join game',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JoinPage()),
              );
            },
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
                'Host game',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HostPage()),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
              'App created by Jonatan Solheim. Spyfall designed by Alexandr Ushan, published by Hobby World. This app is a fan project and not affiliated with Alexandr Ushan or Hobby World.'),
        ),
      ],
    );
  }
}
