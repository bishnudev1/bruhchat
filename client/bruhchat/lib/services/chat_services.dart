import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatServices with ListenableServiceMixin {
  Future fetchAllChats() async {
    final uri = Uri.parse("http://localhost:3000/api/v1/chats");

    final resp = await http.get(uri);
    print(resp.body);

    if (resp.statusCode == 200) {
      print(resp.statusCode);
      return jsonDecode(resp.body);
    } else {
      print("Failed to fetch messages");
      throw Exception("Failed to fetch messages");
    }
  }
}
