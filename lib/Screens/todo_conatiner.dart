// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/Model/model.dart';

class TodoList extends StatefulWidget {
  int id;
  String title;
  DateTime creationdate;
  bool isChecked;
  Function insertFunction;
  Function deleteFunction;
  TodoList({
    Key? key,
    required this.id,
    required this.title,
    required this.isChecked,
    required this.creationdate,
    required this.deleteFunction,
    required this.insertFunction,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationdate: widget.creationdate,
        isChecked: widget.isChecked);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
                activeColor: Colors.blue.shade400,
                shape: const CircleBorder(),
                value: widget.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    widget.isChecked = value!;
                  });
                  //change value of another todo
                  anotherTodo.isChecked = value!;
                  //insert it to database
                  widget.insertFunction(anotherTodo);
                }),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      decoration:
                          widget.isChecked ? TextDecoration.lineThrough : null,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat('hh:mm aaa').format(widget.creationdate),
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                widget.deleteFunction(anotherTodo);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.pink[300],
              )),
        ],
      ),
    );
  }
}
