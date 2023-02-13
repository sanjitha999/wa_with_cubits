import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repository/result_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ResultRepository _resultRepository;
  SearchCubit(this._resultRepository) : super(SearchInitial());

  Future<void> getResults(searchText) async{
    try{
      emit(SearchLoading());
      var resultList = await _resultRepository.getSearchResult(searchText);
      emit(SearchFound(resultList));
    } catch(e){
      emit(SearchError(e.toString()));
    }
  }

}
