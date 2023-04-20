import 'package:flutter/material.dart';
import 'package:todo/widgets/dialog_box.dart';
import 'package:hive_flutter/adapters.dart';
import '../data/database.dart';
import '../widgets/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //reference to hive box
  final _myBox = Hive.box('mybox');
  //create an instance of todo db
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    /// whenever the app runs for the first time
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadDatabase();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  // list of todos

  // List todoList = [
  //   // ["Make reward", false],
  //   // ["Do Nothing", false],
  // ];

// logic for check box
  void checkedVal(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

//save task
  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
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
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
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
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChangedValue: (value) => checkedVal(value, index),
            deleteTask: (context) => deleteTaskValue(index),
          );
        },
      ),
    );
  }
}
