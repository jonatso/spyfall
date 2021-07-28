import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yeet/yeet.dart';

class Connection {
  static String gameId = '';
  static String username = 'notTheSpy';
  static List players = [username];
  static IO.Socket socket = IO.io('http://localhost:4000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });

  static connectAndListen() {
    socket.onConnect((_) {
      Fluttertoast.showToast(msg: "Connected to server");
    });

    socket.onDisconnect((_) {
      Fluttertoast.showToast(msg: "Disconnected from server");
    });

    socket.on('hostingStarted', (gameId) {
      Connection.gameId = gameId;
      Fluttertoast.showToast(msg: "Game hosted on $gameId");
      //context.yeet('/waiting');
    });
  }

  static hostGame(username) {
    Connection.username = username;
    socket.emit('hostGame', username);
  }
}
