import 'package:sqflite/sqflite.dart';
import 'package:todo/Model/model.dart';
import 'package:path/path.dart';

class DatabaseConnect {
  Database? _database;
  //Create A getter and open connection with database

  Future<Database> get database async {
    // This is the Location of our database in device
    final dbPath = await getDatabasesPath();
    // This is the name of our database
    const dbname = 'todo.db';
    // This is joins name and path of our database
    final path = join(dbPath, dbname);
    //open the connection
    _database = await openDatabase(path, version: 1, onCreate: _creatDB);
    return _database!;
  }

  //lets create table in our databse
  Future<void> _creatDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE todo(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      creationdate TEXT,
      isChecked INTEGER
    )

''');
  }

  //lets add data to our database
  Future<void> insertTodo(Todo todo) async {
    //get connection to database
    final db = await database;
    //insert todo
    db.insert('todo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //to delete a todo from database
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    db.delete('todo', where: 'id==?', //this condition will check for id in list
        whereArgs: [todo.id]);
  }

  //function to fetch all todo from database
  Future<List<Todo>> getTodo() async {
    final db = await database;
    //query our database  ans save todo in list of map
    List<Map<String, dynamic>> items =
        await db.query('todo', // this will order list by id
            orderBy: 'id DESC');
    //convert item from list of map to list of todo
    return List.generate(
        items.length,
        (index) => Todo(
            id: items[index]['id'],
            title: items[index]['title'],
            creationdate: DateTime.parse(
                items[index]['creationdate']), //to convert to date time
            isChecked: items[index]['isChecked'] == 1
                ? true
                : false)); //to convert to boolean
  }
}
