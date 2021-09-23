import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart' as model;
import '../services/services.dart' as service;

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      final _response = await service.ArticleService(http.Client()).fetchArticles();
        emit(_response.status! ? ArticleLoaded(_response.data!) : ArticleError(message: _response.message!));
    });
  }
}
