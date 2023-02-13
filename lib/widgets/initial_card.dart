import 'package:flutter/material.dart';

Widget initialCard() {
  return SizedBox(
    height: 550,
    width: double.infinity,
    child: Card(
      elevation: 20,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.manage_search_outlined),
          Text("Get Searching.....")
        ],
      ),
    ),
  );
}