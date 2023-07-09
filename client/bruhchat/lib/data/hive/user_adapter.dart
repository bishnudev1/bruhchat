import 'package:hive/hive.dart';
part 'user_adapter.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  @HiveField(3)
  String createdAt;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
  });
}
