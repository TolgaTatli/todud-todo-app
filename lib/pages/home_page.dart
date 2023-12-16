import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // reference the hive box
  final _myBox = Hive.box("mybox");
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exist data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // saveNewTask

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  // to create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSaved: saveNewTask,
          );
        });
  }

  // delete a task

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "T  O    D  U  D",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.wavy,
              decorationColor: Color.fromARGB(255, 74, 74, 74),
              decorationThickness: 1.6),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade200,
        elevation: 4,
        shape: const CircleBorder(),
        isExtended: true,
        onPressed: createNewTask,
        tooltip: "What are you waiting for?",
        child: const Icon(
          Icons.task_alt_sharp,
          size: 35,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (content, index) {
          return ToDoTile(
              deleteAction: (context) => deleteTask(index),
              onChanged: (value) => checkBoxChanged(value, index),
              taskCompleted: db.toDoList[index][1],
              taskName: db.toDoList[index][0]);
        },
      ),
    );
  }
}
