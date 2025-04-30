class User{
  String name;
  String username;
  String email;
  User({required this.name, required this.username, required this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        username: json['username'],
        email: json['email']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
    };
  }
}