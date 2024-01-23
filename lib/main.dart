import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_search/bloc/repo_search_bloc.dart';
import 'package:repo_search/data/data_provider/repo_search_data_provider.dart';
import 'package:repo_search/data/repository/repo_search_repository.dart';
import 'package:repo_search/presentation/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepoSearchRepository(RepoSearchDataProvider()),
      child: BlocProvider(
        create: (context) => RepoSearchBloc(context.read<RepoSearchRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const DashboardScreen(),
        ),
      ),
    );
  }
}
