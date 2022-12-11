import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/utils/components/my_button.dart';
import '../../controllers/todo_controller.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final ToDoController controller = context.watch<ToDoController>();
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add New Task',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                    text: 'Save',
                    onPressed: () {
                      controller.saveNewTask();
                      Navigator.of(context).pop();
                    }),
                MyButton(
                    text: 'Cancel',
                    onPressed: () {
                      controller.textController.clear();
                      Navigator.of(context).pop();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
