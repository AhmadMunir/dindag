part of 'article_bloc.dart';

@immutable
abstract class ArticleState {
  final List<model.Article> lists;

  ArticleState(this.lists);
}

class ArticleInitial extends ArticleState {
  ArticleInitial() : super([]);
}

class ArticleLoaded extends ArticleState {
  ArticleLoaded(List<model.Article> lists) : super(lists);
}

class ArticleError extends ArticleState {
  final String? message;
  ArticleError({this.message}) : super([]);
}
