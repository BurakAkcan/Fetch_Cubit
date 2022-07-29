import 'package:fetcdata/cubit/postfetch_cubit.dart';
import 'package:fetcdata/screens/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Getir',
            onPressed: () {
              context.read<PostfetchCubit>().fetchApi();
            },
          ),
        ],
        title: const Text("Cubit ile Api Kullanımı"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostfetchCubit, PostfetchState>(
        builder: (context, state) {
          if (state is PostfetchInitial) {
            return Center(
              child: Text(
                "Yaparız bilirsin",
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          } else if (state is PostfetchError) {
            return Center(
              child: Text(state.failure.message),
            );
          } else if (state is PostfetchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostfetchCompleted) {
            return ListView.builder(
              itemCount: state.post.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeDetail(
                            listem: state.post,
                            index: index,
                          ),
                        ));
                      },
                      child: Card(
                        child: ListTile(
                            title: Text(state.post[index].title.toString()),
                            subtitle: Text(state.post[index].body.toString()),
                            leading: CircleAvatar(
                              child: Text(state.post[index].id.toString()),
                            )),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                    )
                  ],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
