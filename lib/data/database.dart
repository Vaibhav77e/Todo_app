import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  //reference to our box
  final _mybox = Hive.box('mybox');

  //runs this method when app is open for 1st time
  void createInitialData() {
    todoList = [
      ["Do reward", false],
      ["Sleeping", false],
    ];
  }

  //load data from db
  void loadDatabase() {
    todoList = _mybox.get("TODOLIST");
  }

  //update the db
  void updateDatabase() {
    _mybox.put("TODOLIST", todoList);
  }
}
