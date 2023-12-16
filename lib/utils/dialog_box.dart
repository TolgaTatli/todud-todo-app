import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Add a new task",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),

            // buttons -> save,cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // save button
                MyButton(onPressed: onSaved, icon: const Icon(Icons.save_alt)),
                const SizedBox(
                  width: 20,
                ),
                // cancel button
                MyButton(
                  onPressed: onCancel,
                  icon: const Icon(Icons.cancel_rounded),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
