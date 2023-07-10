import 'dart:convert';
import 'dart:developer';
import 'package:bruhchat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

import '../../data/hive/user_adapter.dart';
import '../../services/auth_services.dart';
import '../auth/register_screen.dart';

class HomeViewModel extends BaseViewModel {
  late IO.Socket _socket;

  final AuthServices _authServices = AuthServices();

  final List<Chat> _allMessages = [];

  List<Chat> get allMessages => _allMessages;

  checkCurrentUser() {
    final fireEmail = _authServices.auth.currentUser!.email;
    return fireEmail == _currentUserEmail;
  }

  Future fetchAllChats() async {
    final uri = Uri.parse("http://10.0.2.2:3000/api/v1/chats");

    final resp = await http.get(uri);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = jsonDecode(resp.body);
      final List<dynamic> chatData = response['data'];
      _allMessages.addAll(chatData.map((chat) => Chat.fromJson(chat)).toList());
      notifyListeners();
    } else {
      throw Exception("Failed to fetch messages");
    }
  }

  String? _currentUserEmail;
  String? get currentUserEmail => _currentUserEmail;

  String? _currentUsername;
  String? get currentUsername => _currentUsername;

  fetchCurrentUser() async {
    var box = await Hive.openBox<User>('user');
    print(box
        .get("currentUser")!
        .createdAt); // Open the existing box instead of opening it again
    try {
      if (box.isNotEmpty) {
        // Check if the box is not empty
        User? user = box.get("currentUser");
        if (user != null) {
          _currentUserEmail = user.email;
          _currentUsername = user.username;
        } else {
          _currentUserEmail = null;
          print('User not found in Hive');
        }
      } else {
        _currentUserEmail = null;
        print('Hive box is empty');
      }
      notifyListeners();
      await box.close();
    } catch (e) {
      print('Error retrieving user from Hive: $e');
      return e.toString();
    } finally {
      // Close the box if it's open
      if (box.isOpen) {
        await box.close();
      }
    }
  }

  initData() async {
    try {
      await fetchAllChats();
      await fetchCurrentUser();
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
      "sender": _currentUsername.toString(),
      "email": _currentUserEmail.toString(),
      "createdAt": "${DateTime.now().hour}:${DateTime.now().minute}"
    });
    _messageInputController.clear();
  }

  hiveStatus() async {
    var box = await Hive.openBox<User>('user');
    print("Hive Current Status: ${box.get("currentUser")!.email}");
  }

  logoutCurrentUser(BuildContext context) async {
    final response = await _authServices.logoutUser();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ));
  }
}
