class AdminDesa {
  String username;
  String email;
  String password;
  DateTime createdAt;
  //DateTime updatedAt;
  String uid;
  String role;
  // String photoURL;
  String selectedKabupaten;

  AdminDesa({
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.uid,
    required this.role,
    required this.selectedKabupaten,
  });
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'uid': uid,
      'role': role,
      'selectedKabupaten': selectedKabupaten,
    };
  }

  factory AdminDesa.fromMap(Map<String, dynamic> map) {
    return AdminDesa(
      username: map['username'],
      email: map['email'],
      password: map['password'] ?? '',
      createdAt: map['createdAt'] ?? '',
      uid: map['uid'] ?? '',
      role: map['role'] ?? '',
      selectedKabupaten: map['selectedKabupaten'] ?? '',
    );
  }
}
