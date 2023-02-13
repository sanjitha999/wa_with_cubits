part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFound extends SearchState {
  ResultRepository resultRepository;
  SearchFound(this.resultRepository);
}

class SearchError extends SearchState {
  String error;
  SearchError(this.error);
}
