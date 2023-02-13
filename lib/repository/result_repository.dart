import 'dart:convert';
import 'package:http/http.dart' as http;

class ResultRepository{
  List pageTitles;
  List pageLinks;
  ResultRepository(this.pageTitles, this.pageLinks);

  Future<ResultRepository> getSearchResult(searchText) async {
    String urlPrefix =
        'https://en.wikipedia.org/w/api.php?action=opensearch&search=';
    String urlSuffix = '&limit=15&namespace=0&format=json';
    String fullUrl = '$urlPrefix$searchText$urlSuffix';
    var response = await http.get(Uri.parse(fullUrl));
    var data = jsonDecode(response.body);
    pageTitles = data[1];
    pageLinks = data[3];
    return ResultRepository(pageTitles, pageLinks);
  }

}