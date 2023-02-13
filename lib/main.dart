// import 'dart:js_util';

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_set_state/cubits/search_cubit.dart';
import 'package:try_set_state/repository/result_repository.dart';
import './screens/wiki_app_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(ResultRepository([], [])),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: AnimatedSplashScreen(
            splash: const Center(
              child: Card(
                color: Colors.amber,
                shape: CircleBorder(side: BorderSide.none),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(child: Text("W~A",
                    style: TextStyle(fontSize: 20, color: Colors.white),)),
                ),
              ),
            ),

            nextScreen: const WikiApp()),
      ),
    );
  }
}
