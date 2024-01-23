import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_search/data/repository/repo_search_repository.dart';
import 'package:repo_search/models/repo_search_model.dart';

part 'repo_search_event.dart';
part 'repo_search_state.dart';

class RepoSearchBloc extends Bloc<RepoSearchEvent, RepoSearchState> {

final RepoSearchRepository repoSearchRepository;

  RepoSearchBloc(this.repoSearchRepository) : super(RepoSearchInitial()) {
    on<RepoSearchFetched>(_getSearchRepositories);
  }

void _getSearchRepositories(RepoSearchFetched event, Emitter<RepoSearchState> emit) async {
  emit(RepoSearchLoading());

  try {
    final repos = await repoSearchRepository.searchRepositories('flutter', 20, page: 1);
    emit(RepoSearchSuccess(repos));
  }
  catch (e) {
    emit(RepoSearchFailure(e.toString()));
  }
}
}
