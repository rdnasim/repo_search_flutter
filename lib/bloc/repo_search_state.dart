part of 'repo_search_bloc.dart';

@immutable
abstract class RepoSearchState {}

class RepoSearchInitial extends RepoSearchState {}

class RepoSearchSuccess extends RepoSearchState {
  final List<RepoSearchModel> repos;

  RepoSearchSuccess(this.repos);
}

class RepoSearchFailure extends RepoSearchState {
  final String error;

  RepoSearchFailure(this.error);
}

class RepoSearchLoading extends RepoSearchState {}
