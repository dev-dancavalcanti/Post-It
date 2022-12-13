import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/utils/widgets/todo_empty.dart';
import '../controllers/todo_controller.dart';
import '../utils/widgets/todo_dialog.dart';
import '../utils/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ToDoController controller = context.watch<ToDoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Post-it',
          ),
        ),
        leading: const SizedBox(),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/contact');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.info_sharp,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider.value(
          value: controller,
          builder: (context, child) {
            if (controller.toDoIsEmpty) {
              return const ToDoEmpty();
            } else {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.toDoList.toDo.length,
                      itemBuilder: (context, index) {
                        return ToDoTile(
                          title: controller.toDoList.toDo[index].title,
                          taskCompleted:
                              controller.toDoList.toDo[index].enabled,
                          onChanged: (value) =>
                              controller.checkBoxChanged(value, index),
                          deletedTask: (context) =>
                              controller.deletedTask(index),
                          color: Colors.primaries[
                              controller.toDoList.toDo[index].intColor],
                        );
                      });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const DialogBox();
              });
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
