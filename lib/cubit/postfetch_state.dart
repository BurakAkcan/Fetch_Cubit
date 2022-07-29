part of 'postfetch_cubit.dart';

@immutable
abstract class PostfetchState {
  List<Object> get props => [];
}

class PostfetchInitial extends PostfetchState {}

class PostfetchLoading extends PostfetchState {}

class PostfetchCompleted extends PostfetchState {
  final List<Post> post;

  PostfetchCompleted(this.post);
  @override
  List<Object> get props => [post];
}

class PostfetchError extends PostfetchState {
  final Failure failure;

  PostfetchError(this.failure);

  @override
  List<Object> get props => [failure];
}
