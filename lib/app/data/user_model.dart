class UserModel {
  late String uid;
  late String email;
  late String username;
  late String role;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'] ?? '',
      role: map['role'] ?? '',
    );
  }
}
