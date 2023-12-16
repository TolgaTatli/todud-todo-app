import 'package:hive/hive.dart';

class TodoDatabase {
  List toDoList = [];

  // reference the box
  final _myBox = Hive.box("mybox");

  // run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      ["Make tutorial", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
