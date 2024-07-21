// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_page_flutter/util/dialog_box.dart';
import 'package:login_page_flutter/util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  //text controller
  final _controller = TextEditingController();
  //list of todo task
  List todolist = [
    ['Buy Grocery', false],
    ['Do coding',false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  //save new task
  void saveNewTask(){
    setState(() {
      todolist.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

//create a new task 
void createNewTask(){
  showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
  });
}
//delete task
void deleteTask(int index) {
   setState(() {
     todolist.removeAt(index);
   });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Todo List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: createNewTask,
          child: Icon(Icons.add),
        
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(taskName: todolist[index][0], 
          taskCompleted: todolist[index][1],
          onChanged: (value) => checkBoxChanged(value,index),
          deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
