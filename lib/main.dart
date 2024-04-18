import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/screens/active-users.dart';
import 'package:user_manager/screens/add_user.dart';
import 'package:user_manager/screens/archived_users.dart';
import 'package:user_manager/utils/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Widget? child;

  const MyApp({this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DatabaseViewModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          initialRoute: '/',
          routes: {
            "/": (context) => child ?? const ActiveUsers(),
            "/addUser": (context) => AddUser(),
            "/archive": (context) => const ArchivedUsers(),
          },
        ));
  }
}
