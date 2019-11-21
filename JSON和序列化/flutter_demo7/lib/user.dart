class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json): 
  name = json['name'], email = json['email'];

  Map<String, dynamic> toJson() =>
  {
    'name': name,
    'email': email,
  };
}

/**
 * Map userMap = JSON.decode(json);
 * var user = new User.fromJson(userMap);
 * print("${user.name}")
 * 
 * String json = JSON.encode(user);
 */