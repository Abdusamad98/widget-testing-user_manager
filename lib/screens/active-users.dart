// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/utils/database.dart';
import 'package:user_manager/utils/user_card.dart';

import '../utils/source_enum.dart';
import 'add_user.dart';
import 'archived_users.dart';

class ActiveUsers extends StatelessWidget {
  const ActiveUsers({super.key});

  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Active Users"),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(ArchivedUsers.routeName),
              icon: const Icon(CupertinoIcons.archivebox))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Consumer<DatabaseViewModel>(builder: (context, database, child) {
          return database.activeUsers.isNotEmpty
              ? ListView.builder(
                  itemCount: database.activeUsers.length,
                  itemBuilder: (context, index) => UserCard(
                      user: database.activeUsers[index], source: Source.active))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("You have no active users."),
                      SizedBox(height: 5.0),
                      Text("Use the Add icon below to add new users"),
                      SizedBox(height: 5.0),
                      Text("Or activate users in your archive."),
                    ],
                  ),
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.of(context).pushNamed(AddUser.routeName);
        },
        child: const Icon(CupertinoIcons.person_add_solid, color: Colors.white),
      ),
    );
  }
}
