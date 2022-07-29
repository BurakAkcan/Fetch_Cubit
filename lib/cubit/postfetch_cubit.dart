import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fetcdata/models/failure_post.dart';
import 'package:fetcdata/models/post_model.dart';
import 'package:fetcdata/repository/api_repository.dart';

part 'postfetch_state.dart';

class PostfetchCubit extends Cubit<PostfetchState> {
  PostfetchCubit(
    this.apiRepository,
  ) : super(PostfetchInitial());

  final ApiRepository apiRepository;

  Future fetchApi() async {
    try {
      final List<Post>? postList = await apiRepository.getPostData();
      emit(PostfetchCompleted(postList ?? []));
    } on Failure catch (e) {
      emit(PostfetchError(Failure(message: e.toString())));
    } catch (e) {
      print("$e");
    }
  }
}
