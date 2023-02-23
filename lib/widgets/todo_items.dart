// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app3/constants/colors.dart';
import 'package:todo_app3/models/todo.dart';

class TodoItems extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onDeleteItem;
  const TodoItems(
      {super.key,
      required this.todo,
      required this.onTodoChanged,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            // ignore: avoid_print
            print('list style clicked');
            onTodoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                debugPrint('icon button clicked');
                onDeleteItem(todo.id);
              },
              icon: Icon(Icons.delete),
              iconSize: 20,
              color: Colors.white,
            ),
          ),
        ));
  }
}
