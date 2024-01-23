import 'dart:convert';

import 'package:repo_search/data/data_provider/repo_search_data_provider.dart';
import 'package:repo_search/models/repo_search_model.dart';

class RepoSearchRepository {
  final RepoSearchDataProvider repoSearchDataProvider;

  RepoSearchRepository(this.repoSearchDataProvider);

  Future<List<RepoSearchModel>> searchRepositories(String query, int perPage) async {
    try {
      final searchResult = await repoSearchDataProvider.searchRepositories(query, perPage);

      if (searchResult.isEmpty) {
        return [];
      }

      final List<dynamic> items = jsonDecode(searchResult)['items'];

      return items.map((item) => RepoSearchModel.fromMap(item)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}