import 'package:flutter/material.dart';

Widget loadingPage() {
  return const Padding(
    padding: EdgeInsets.all(40),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
