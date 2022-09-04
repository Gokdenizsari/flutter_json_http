

import 'dart:convert';

TodosModel todosModelFromMap(String str) => TodosModel.fromMap(json.decode(str));

String todosModelToMap(TodosModel data) => json.encode(data.toMap());

class TodosModel {
    TodosModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    final int userId;
    final int id;
    final String title;
    final bool completed;

    factory TodosModel.fromMap(Map<String, dynamic> json) => TodosModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
