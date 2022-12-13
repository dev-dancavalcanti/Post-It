import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../../controllers/todo_controller.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile(
      {super.key,
      required this.title,
      required this.taskCompleted,
      required this.deletedTask,
      required this.color,
      this.onChanged});

  final String title;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deletedTask;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ToDoController controller = context.watch<ToDoController>();

    return ChangeNotifierProvider.value(
      value: controller,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                  onPressed: deletedTask,
                  icon: Icons.delete,
                  backgroundColor: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(10)),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Text(
                    title,
                    style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
