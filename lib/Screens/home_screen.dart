import 'package:flutter/material.dart';
import 'package:todo/Database/database.dart';
import 'package:todo/Model/model.dart';
import 'package:todo/Screens/todo_list.dart';
import 'package:todo/Screens/user_input.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
            color: Colors.purple.shade200,
            offset: Offset(2, 2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.blue.shade100,
            offset: Offset(-2, -2),
            blurRadius: 15,
            spreadRadius: 1,
          )
        ]),
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueAccent.shade200,
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                isScrollControlled: true,
                context: context,
                builder: (context) => UserInput(insertFunction: addTodo));
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'ToDayDo',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
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
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12)),
          child: const Text(
            '',
            style: TextStyle(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
/*
 
Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'Add Task',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ))),
 
*/