import 'package:flutter/material.dart';
import 'package:todo/widgets/dialog_box.dart';

import '../widgets/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //text controller
  final _controller = TextEditingController();
  // list of todos
  List todoList = [
    ["Make reward", false],
    ["Do Nothing", false],
    ["Work on projects", false],
    ["Watch anime", false],
  ];

// logic for check box
  void checkedVal(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

//save task
  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

//create task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controllertext: _controller,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task
  void deleteTaskValue(int index) {
    setState(() {
      todoList.removeAt(index);
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
            onChangedValue: (value) => checkedVal(value, index),
            deleteTask: (context) => deleteTaskValue(index),
          );
        },
      ),
    );
  }
}
