import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/search_cubit.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: textController,
            onSubmitted: (_) => onSubmitted(context, textController.text),
            autofocus: true,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: 'Enter your search text here',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await ApiService.showSuggestions(pattern);
            // return await BackendService.getSuggestions(pattern);
          },
          itemBuilder: (context, itemData) {
            return ListTile(
              title: Text(itemData),
            );
          },
          onSuggestionSelected: (suggestion) {
            return onSuggestion(context, suggestion);
          },
        ),
      ),
    );
  }
}

class ApiService {
  static Future<List> showSuggestions(String query) async {
    if(query.length<1){
      return [];
    }
    var url = Uri.https('api.datamuse.com', '/sug', {'s': query});
    var response = await http.get(url);
    List suggestions = [];
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (Map i in json) {
        suggestions.add(i['word']);
      }
    } else {
      return [];
    }
    return suggestions.toList();
  }
}

Widget normalTextField(TextEditingController textController,
    Function onSubmitted, BuildContext context) {
  return TextField(
    controller: textController,
    onSubmitted: (_) => onSubmitted(context, textController.text),
    decoration: InputDecoration(
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      labelText: 'Enter your search text here',
      suffixIcon: Icon(Icons.search),
    ),
  );
}

void onSuggestion(BuildContext context, String searchText) {
  final searchCubit = context.read<SearchCubit>();
  searchCubit.getResults(searchText);
}
