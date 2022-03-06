class Todo {
  int? id;
  String title;
  DateTime creationdate;
  bool isChecked;
  Todo(
      {this.id,
      required this.title,
      required this.creationdate,
      required this.isChecked});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationdate': creationdate
          .toString(), //sqflite dosnot support dateTime that we convert it to string,
      'isChecked': isChecked
          ? 1
          : 0 // sqflite dosnot support bool we  convert it to integer,
    };
  }

  //This fuction for debug only
  @override
  String toString() {
    return 'Todo(id:$id,title:$title,creationdate:$creationdate,isChecked:$isChecked)';
  }
}
