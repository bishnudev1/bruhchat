class Chat {
  String sender;
  String message;
  String email;
  String createdAt;

  Chat({required this.sender, required this.message, required this.email, required this.createdAt});

  Map<String, dynamic> toJson() {
    return {"sender": sender, "message": message, email: "email", createdAt: "createdAt"};
  }

  factory Chat.fromJson(Map<String, dynamic> msg) {
    return Chat(
      sender: msg["sender"],
      message: msg["message"],
      email: msg["email"],
      createdAt: msg["createdAt"],
    );
  }
}
