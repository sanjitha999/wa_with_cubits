import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/search_cubit.dart';
import '../widgets/search_bar.dart';
import '../widgets/error_card.dart';
import '../widgets/initial_card.dart';
import '../widgets/loading_page_card.dart';
import '../widgets/result_card.dart';

class WikiApp extends StatefulWidget {
  const WikiApp({Key? key}) : super(key: key);

  @override
  State<WikiApp> createState() => _WikiAppState();
}

class _WikiAppState extends State<WikiApp> {
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();

    void onSubmitted(BuildContext context, String searchText) {
      final searchCubit = context.read<SearchCubit>();
      searchCubit.getResults(searchText);
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "WiKi~App",
        style: TextStyle(color: Colors.white),
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //todo: SearchBar
            SearchBar(textController: textController, onSubmitted: onSubmitted),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return initialCard();
                } else if (state is SearchLoading) {
                  return loadingPage();
                } else if (state is SearchFound) {
                  return resultCard(state.resultRepository);
                } else if (state is SearchError) {
                  return errorCard();
                } else {
                  return const Center(
                    child: Text('Else state'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}






