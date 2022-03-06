// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/Database/database.dart';
import 'package:todo/Screens/detail_page.dart';
import 'package:todo/Screens/todo_conatiner.dart';

class TodoListTile extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  TodoListTile({
    Key? key,
    required this.insertFunction,
    required this.deleteFunction,
  }) : super(key: key);
  var db = DatabaseConnect();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;
          return dataLength == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.article_outlined,
                        size: 80,
                        color: Color(0xffa9a9a9),
                      ),
                      Text(
                        'No to-dos ',
                        style:
                            TextStyle(color: Color(0xffa9a9a9), fontSize: 16),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: dataLength,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        todo: data[index],
                                      )));
                        },
                        child: TodoList(
                          id: data[index].id,
                          title: data[index].title,
                          isChecked: data[index].isChecked,
                          creationdate: data[index].creationdate,
                          insertFunction: insertFunction,
                          deleteFunction: deleteFunction,
                        ),
                      ));
        },
      ),
    );
  }
}
