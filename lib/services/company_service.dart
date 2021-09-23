import 'dart:convert';

import 'package:http/http.dart' as http;

import '../tools/config.dart' as config;
import '../models/models.dart' as model;
import '../services/services.dart' as service;


class CompanyService {

  final http.Client client;

  String _url = config.url + '/company';

  CompanyService(this.client);

  Future<config.CurrentResponse<List<model.Company>>> getAll() async {
    try {
      final _res = await config.CurrentRequest(client).getRequest(_url, headers: {
        'Authorization':'Bearer ${service.AuthService(this.client).getToken()}'
      });

      if (_res.statusCode != 200) {
        throw new Exception(_res.body);
      }

      var data = jsonDecode(_res.body);

      return config.CurrentResponse(
          true, message: 'data fetched', data: List<model.Company>.from(data['data'].map((x) => model.Company.fromJson(x))));
    } catch (e) {
      return config.CurrentResponse(false, message: 'failed to fetch, ${e.toString()}');
    }
  }
}