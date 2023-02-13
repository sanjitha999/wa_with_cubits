import 'package:flutter/material.dart';

Widget errorCard(){
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
          Icon(Icons.error_outline, color: Colors.red),
          Text("Oops....Check your internet"),
        ],
      ),
    ),
  );
}
