import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketServices with ListenableServiceMixin {
  late IO.Socket _socket;

  IO.Socket get socket => _socket;

  startSocketServer() {
    _socket = IO.io("http://localhost:3000",
        IO.OptionBuilder().setTransports(['websocket']).build());
    _socket.onConnect((data) => log("Connection Established"));
    _socket.onConnectError((data) => print("Connection Error: $data"));
    _socket
        .onDisconnect((data) => log("Socket.IO Server has been disconnected"));
    return _socket;
  }
}
