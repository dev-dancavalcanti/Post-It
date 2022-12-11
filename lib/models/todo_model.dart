class ToDoModel {
  late List<ToDo> toDo;

  ToDoModel({required this.toDo});

  ToDoModel.fromJson(Map<String, dynamic> json) {
    if (json['toDo'] != null) {
      toDo = <ToDo>[];
      json['toDo'].forEach((v) {
        toDo.add(ToDo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['toDo'] = toDo.map((v) => v.toJson()).toList();
    return data;
  }
}

class ToDo {
  final String title;
  late bool enabled;
  final int intColor;

  ToDo({
    required this.title,
    required this.enabled,
    required this.intColor,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'],
      enabled: json['enabled'],
      intColor: json['intColor'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['enabled'] = enabled;
    data['intColor'] = intColor;
    return data;
  }
}
