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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5, top: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the to-do';
                        }
                        return null;
                      },
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: text,
                      decoration: InputDecoration(
                          hintText: 'To-do',
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          border: InputBorder.none),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(25)),
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
                        'Save',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ))),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
 



                 
*/