// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/Model/model.dart';

class UserInput extends StatelessWidget {
  Function insertFunction;
  UserInput({Key? key, required this.insertFunction}) : super(key: key);
  var text = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xffe6e6e6),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your To-do';
                      }
                      return null;
                    },
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    controller: text,
                    decoration: const InputDecoration(
                        hintText: 'Add New Todo',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var myTodo = Todo(
                              title: text.text,
                              creationdate: DateTime.now(),
                              isChecked: false);
                          insertFunction(myTodo);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Save to-do',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
/*

*/