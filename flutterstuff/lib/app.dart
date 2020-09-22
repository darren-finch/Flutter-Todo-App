import 'package:flutter/material.dart';
import 'package:flutterstuff/data/db/database.dart';
import 'package:flutterstuff/screens/task_details/task_details_screen.dart';
import 'package:provider/provider.dart';
import 'screens/todo_list_home/todo_list_screen.dart';
import 'style.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppDatabase(),
      child: MaterialApp(
        initialRoute: TodoListScreen.routeName,
        routes: {
          TodoListScreen.routeName: (context) => TodoListScreen(),
          TaskDetailsScreen.routeName: (context) => TaskDetailsScreen()
        },
        theme: ThemeData(
          appBarTheme:
              AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
          textTheme:
              TextTheme(headline6: TitleTextStyle, bodyText2: Body1TextStyle),
        ),
      ),
    );
  }
}
