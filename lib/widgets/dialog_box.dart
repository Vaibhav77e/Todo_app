import 'package:flutter/material.dart';
import 'package:todo/widgets/mybotton.dart';

class DialogBox extends StatelessWidget {
  final controllertext;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {required this.controllertext,
      required this.onSave,
      required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        //get user input
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controllertext,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add New Task"),
            ),
            //buttom to save or cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "save", onPressed: onSave),
                const SizedBox(
                  width: 8,
                ),
                //cancel button
                MyButton(text: "cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
