import 'package:json_annotation/json_annotation.dart';
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "completed")
  bool completed;
  Todo(
    this.userId,
    this.id,
    this.title,
    this.completed,
  );

  factory Todo.fromJson(Map<String, dynamic> data) => _$TodoFromJson(data);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  static listFromJson(list) {
    if (list is List) {
      return List<Todo>.from(list.map((x) => Todo.fromJson(x)));
    }
    // Put için gerekli
    return Map<String, dynamic>.from(list);
  }
}
