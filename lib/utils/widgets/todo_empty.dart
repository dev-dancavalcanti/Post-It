import 'package:flutter/material.dart';

class ToDoEmpty extends StatelessWidget {
  const ToDoEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/dino.png',
            ),
          ),
          const ListTile(
            title: Text(
              'Wow, you don\'t have more post-it at the moment',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19),
            ),
            subtitle: Text(
              'Don\'t worry, you just need create more!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
