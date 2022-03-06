import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/Database/database.dart';
import 'package:todo/Model/model.dart';
import 'package:todo/Screens/todo_list.dart';
import 'package:todo/Screens/user_input.dart';
import 'package:todo/constans/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //function to add todo
  var db = DatabaseConnect();
  void addTodo(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteTodo(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        title: const Text(
          'ToDayDo',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, ),
        child: Column(
          children: [
            TodoListTile(
              insertFunction: addTodo,
              deleteFunction: deleteTodo,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserInput(insertFunction: addTodo)));
              },
              child: const Text(
                'Add Task',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ))),
    );
  }
}
/*
 

 
*/