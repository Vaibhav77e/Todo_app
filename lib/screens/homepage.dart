import 'package:flutter/material.dart';
import 'package:todo/widgets/dialog_box.dart';

import '../widgets/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // list of todos
  List todoList = [
    ["Make reward", false],
    ["Do Nothing", false],
    ["Work on projects", false],
    ["Watch anime", false],
  ];

  void checkedVal(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO-Do'),
        elevation: 0,
      ),
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChangedValue: (value) => checkedVal(value, index));
        },
      ),
    );
  }
}
