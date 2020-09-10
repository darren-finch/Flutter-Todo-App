import 'package:flutter/material.dart';
import './screens/todo_list_home.dart';
import 'style.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TodoListHome(),
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
            textTheme: TextTheme(
                headline6: TitleTextStyle, bodyText2: Body1TextStyle)));
  }
}
