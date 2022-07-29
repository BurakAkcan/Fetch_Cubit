import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fetcdata/cubit/postfetch_cubit.dart';
import 'package:fetcdata/models/post_model.dart';

class HomeDetail extends StatelessWidget {
  HomeDetail({Key? key, required this.listem, required this.index})
      : super(key: key);
  final List<Post> listem;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detay"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(listem[index].body.toString()),
          Text(listem[index].title.toString())
        ],
      )),
    );
  }
}
