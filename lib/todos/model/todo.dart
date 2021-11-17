import 'package:json_annotation/json_annotation.dart';
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;
  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> data) => _$TodoFromJson(data);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  static List<Todo> listFromJson(list) => List<Todo>.from(list.map((x) => Todo.fromJson(x)));
}
