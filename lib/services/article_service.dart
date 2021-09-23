import 'dart:convert';

import 'package:http/http.dart' as http;
import '../tools/config.dart' as config;
import '../models/models.dart' as model;

class ArticleService {
  final http.Client client;

  String _url = config.url;

  ArticleService(this.client);

  Future<config.CurrentResponse<List<model.Article>>> fetchArticles() async {
    try {
    final _res = await config.CurrentRequest(client).getRequest(_url + '/article', headers: {});

      if (_res.statusCode != 200) {
        throw new Exception(_res.body);
      }

      var data = jsonDecode(_res.body);

      return config.CurrentResponse(
          true, message: 'data fetched', data: List<model.Article>.from(data['data'].map((x) => model.Article.fromJson(x))));
    } catch (e) {
      return config.CurrentResponse(false, message: 'failed to fetch, ${e.toString()}');
    }
  }
}