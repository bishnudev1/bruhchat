import 'dart:convert';
import 'dart:developer';
import 'package:bruhchat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/hive/user_adapter.dart';
import '../../services/auth_services.dart';

class HomeViewModel extends BaseViewModel {
  late IO.Socket _socket;

  final AuthServices _authServices = AuthServices();

  final List<Chat> _allMessages = [];

  String? get currentUserEmail => _authServices.currentUserEmail;
  String? get currentUserName=> _authServices.currentUsername;

  List<Chat> get allMessages => _allMessages;

  Future fetchAllChats() async {
    final uri = Uri.parse("http://10.0.2.2:3000/api/v1/chats");

    final resp = await http.get(uri);
    print(resp.body);

    if (resp.statusCode == 200) {
      print(resp.statusCode);
      final response = jsonDecode(resp.body);
      final List<dynamic> chatData = response['data'];
      _allMessages.addAll(chatData.map((chat) => Chat.fromJson(chat)).toList());
      notifyListeners();
    } else {
      print("Failed to fetch messages");
      throw Exception("Failed to fetch messages");
    }
  }

  initData() async {
    try {
      await _authServices.fetchCurrentUser();
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

    _socket = IO.io("http://10.0.2.2:3000",
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
      "sender": _authServices.currentUsername.toString(),
      "email": _authServices.currentUserEmail.toString(),
      "createdAt": "${DateTime.now().hour}:${DateTime.now().minute}"
    });
    _messageInputController.clear();
  }

  hiveStatus() async {
    var box = await Hive.openBox<User>('user');
    print("Hive Current Status: ${box.get("currentUser")!.email}");
  }

  logoutCurrentUser() async {
    final response = await _authServices.logoutUser();
    locator<NavigationService>().replaceWith(Routes.loginScreen);
  }
}
