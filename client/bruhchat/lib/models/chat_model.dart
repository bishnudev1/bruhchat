class Chat {
  String? sender;
  String? message;

  Chat({this.sender, this.message});

  Map<String, dynamic> toJson() {
    return {"sender": sender, "message": message};
  }

  factory Chat.fromJson(Map<String, dynamic> msg) {
    return Chat(
        sender: msg["sender"],
        message: msg["message"]);
  }
}
