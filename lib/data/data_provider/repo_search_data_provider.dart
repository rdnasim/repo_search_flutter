import 'package:http/http.dart' as http;

class RepoSearchDataProvider {
  Future<String> searchRepositories(String query, int perPage, {int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.github.com/search/repositories?q=$query&per_page=$perPage&page=$page'),
      );

      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
