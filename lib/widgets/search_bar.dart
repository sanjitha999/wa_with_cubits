import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController textController;
  final Function onSubmitted;

  const SearchBar({
    Key? key,
    required this.textController,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 5,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        child: TextField(
          controller: textController,
          onSubmitted: (_) => onSubmitted(context, textController.text),
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Enter your search text here',
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
