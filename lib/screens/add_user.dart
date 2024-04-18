import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/utils/database.dart';
import 'package:user_manager/utils/user.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  static String routeName = "/addUser";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add User")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _firstNameController,
              key: const Key("firstNameKey"),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "First Name",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 17, vertical: 0),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _lastNameController,
              key: const Key("lastNameKey"),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last Name",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 17, vertical: 0),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                  onPressed: () {
                    //If either of the inputs is empty, do nothing
                    if (_firstNameController.text.isEmpty ||
                        _lastNameController.text.isEmpty) return;

                    //Retrieve the Database Provider
                    DatabaseViewModel database =
                        Provider.of<DatabaseViewModel>(context, listen: false);
                    //Create User with the first name and last name
                    User user = User(
                        _firstNameController.text, _lastNameController.text);

                    //Add user to List of active users
                    database.addNewUser(user).then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("User added successfully"),
                                backgroundColor: Colors.green)));

                    _firstNameController.clear();
                    _lastNameController.clear();
                  },
                  child: const Text("ADD USER")),
            )
          ],
        ),
      ),
    );
  }
}
