import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstuff/screens/todo_item.dart';
import 'package:flutterstuff/screens/todo_list.dart';

import '../style.dart';

class TodoListHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Tasks"),
      ),
      body: TodoList(),
      backgroundColor: backgroundColor,
    );
  }
}
