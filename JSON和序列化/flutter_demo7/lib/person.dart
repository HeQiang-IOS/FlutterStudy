import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()

class Person {
  String name;
  String email;

  Person(this.name, this.email);

  factory Person.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}