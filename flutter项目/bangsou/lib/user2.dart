
class User2 {
  final String name;
  final String email;

  User2(this.name, this.email);

  User2.fromJson(Map<String, dynamic> json): name= json['name'], email = json['email'];
  Map<String, dynamic> toJson() => <String, dynamic> {
    'name':name,
    'email':email,
  };
}
  