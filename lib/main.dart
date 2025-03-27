import 'package:flutter/material.dart';
import 'package:go_router/src/router.dart';
import 'package:to_do_app_2/core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      routerConfig: appRouter, 
      
    );
  }
}



