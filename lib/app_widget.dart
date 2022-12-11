import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/controllers/todo_controller.dart';
import 'package:todos/controllers/url_controller.dart';
import 'package:todos/repository/shared_repository.dart';
import 'package:todos/screens/contact_me_page.dart';
import 'package:todos/screens/home_page.dart';
import 'package:todos/screens/splash_page.dart';
import 'package:todos/repository/hive_repository.dart';
import 'package:todos/services/todo_interface.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IToDoDataSource>(create: (_) => SharedRepository()),
        ChangeNotifierProvider<ToDoController>(
          create: (__) => ToDoController(__.read<IToDoDataSource>()),
        ),
        Provider<UrlController>(create: (context) => UrlController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Post-it',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.yellow[200],
          primarySwatch: Colors.yellow,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
          '/contact': (context) => const ContactMePage()
        },
      ),
    );
  }
}
