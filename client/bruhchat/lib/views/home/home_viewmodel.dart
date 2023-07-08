import 'dart:convert';
import 'dart:developer';
import 'package:bruhchat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class HomeViewModel extends BaseViewModel {
  late IO.Socket _socket;

  final List<Chat> _allMessages = [];

  List<Chat> get allMessages => _allMessages;

  Future fetchAllChats() async {
    final uri = Uri.parse("http://localhost:3000/chats");

    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      final response = jsonDecode(resp.body);
      final List<dynamic> chatData = response['data'];
      _allMessages.addAll(chatData.map((chat) => Chat.fromJson(chat)).toList());
      notifyListeners();
    } else {
      throw Exception("Failed to fetch messages");
    }
  }

  initChats() async {
    try {
      await fetchAllChats();
    } catch (e) {
      print('Error initializing chats: $e');
    }
  }

  addNewMessage(Chat chat) {
    _allMessages.add(chat);
    notifyListeners();
  }

  socketInit() {
    //Important: If your server is running on localhost and you are testing your app on Android then replace http://localhost:3000 with http://10.0.2.2:3000

    _socket = IO.io("http://localhost:3000",
        IO.OptionBuilder().setTransports(['websocket']).build());
    _socket.onConnect((data) => log("Connection Established"));
    _socket.onConnectError((data) => print("Connection Error: $data"));
    _socket
        .onDisconnect((data) => log("Socket.IO Server has been disconnected"));

    _socket.on("message", (data) => {addNewMessage(Chat.fromJson(data))});
  }

  final TextEditingController _messageInputController = TextEditingController();
  TextEditingController get messageInputController => _messageInputController;

  sendMessage() {
    _socket.emit("message", {
      "message": _messageInputController.text.toString(),
      "sender": _socket.id
    });
    _messageInputController.clear();
  }
}
