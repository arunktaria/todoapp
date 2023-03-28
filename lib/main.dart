import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todoapp/GetxLogin.dart';
import 'package:todoapp/HiveDatabase/HiveTesterPage.dart';
import 'package:todoapp/HomePage.dart';
import 'package:todoapp/cubit/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'post',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider(
        create: (context) => TodoCubit(),
        child: const HiveTesterPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
