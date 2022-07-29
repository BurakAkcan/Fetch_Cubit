import 'package:fetcdata/cubit/postfetch_cubit.dart';
import 'package:fetcdata/repository/api_repository.dart';
import 'package:fetcdata/screens/home_page.dart';
import 'package:fetcdata/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp(
      apiService: ApiService(),
    ));

class MyApp extends StatelessWidget {
  final ApiService apiService;

  MyApp({Key? key, required this.apiService}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostfetchCubit(ApiRepository(apiService)),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          title: 'Material App',
          home: HomePage()),
    );
  }
}
