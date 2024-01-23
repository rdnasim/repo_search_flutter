import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_search/bloc/repo_search_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RepoSearchBloc>().add(RepoSearchFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search Repo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.read<RepoSearchBloc>().add(RepoSearchFetched());
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: BlocBuilder<RepoSearchBloc, RepoSearchState>(builder: (context, state) {
          if (state is RepoSearchFailure) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is! RepoSearchSuccess) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return ListView.builder(
              itemCount: state.repos.length,
              itemBuilder: (context, index) {
                final repo = state.repos[index];

                return ListTile(
                  title: Text(repo.name),
                );
              });
        }));
  }
}
