import 'package:bruhchat/models/chat_model.dart';
import 'package:bruhchat/services/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/hive/user_adapter.dart';
import '../../services/auth_services.dart';
import '../../services/socket_services.dart';

class HomeViewModel extends BaseViewModel {
  final AuthServices _authServices = AuthServices();
  final ChatServices _chatServices = ChatServices();
  final SocketServices _socketServices = SocketServices();

  final List<Chat> _allMessages = [];

  String? get currentUserEmail => _authServices.currentUserEmail;
  String? get currentUserName => _authServices.currentUsername;

  List<Chat> get allMessages => _allMessages;

  Future initializeChats() async {
    final chats = await _chatServices.fetchAllChats();
    final List<dynamic> chatData = await chats['data'];
    _allMessages.addAll(chatData.map((chat) => Chat.fromJson(chat)).toList());
    notifyListeners();
  }

  initData() async {
    try {
      await _authServices.fetchCurrentUser();
      await initializeChats();
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
    IO.Socket socket = _socketServices.startSocketServer();

    socket.on("message", (data) => {addNewMessage(Chat.fromJson(data))});
  }

  final TextEditingController _messageInputController = TextEditingController();
  TextEditingController get messageInputController => _messageInputController;

  sendMessage() {
    _socketServices.socket.emit("message", {
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
