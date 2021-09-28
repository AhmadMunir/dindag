import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../tools/config.dart' as config;

class AuthService {
  final http.Client client;

  String _url = config.url;

  AuthService(this.client);

  Future<config.CurrentResponse<User>> signin(
      String email, String password) async {
    try {
      var form = {
        'email': email.trim().toString(),
        'password': password.trim().toString(),
      };

      print(form);

      final _res = await config.CurrentRequest(client)
          .postRequest(_url + '/signin', data: form, file: {}, headers: {});

      var data = jsonDecode(_res.body);

      if (_res.statusCode != 200 && _res.statusCode == 400) {
        throw new Exception(data['message']);
      }

      await saveToken(data['data']['token']);

      return config.CurrentResponse(true,
          message: 'Login Berhasil', data: User.fromJson(data['data']['user']));
    } catch (e) {
      return config.CurrentResponse(false,
          message: 'failed,${config.removeException(e.toString())}');
    }
  }

  Future<config.CurrentResponse> signup(
      User user, Map<String, String>? files) async {
    try {
      final _res = await config.CurrentRequest(client)
          .postRequest(_url + '/signup', data: user.toJson(), file: files, headers: {});

      if (_res.statusCode != 200 && _res.statusCode == 400) {
        var data = jsonDecode(_res.body);
        throw new Exception(data['message']);
      }
    print(_res.body);

      return config.CurrentResponse(true,
          message: 'Pendaftaran Berhasil, Silahkan Login untuk memulai',
          data: _res.body);
    } catch (e) {
      return config.CurrentResponse(false, message: 'Failed, ${e.toString()}');
    }
  }

  Future<config.CurrentResponse<User>> account() async {
    try {
      final _res = await config.CurrentRequest(client).getRequest(
          _url + '/account',
          headers: {'Authorization': 'Bearer ${await getToken()}'});

      var data = jsonDecode(_res.body);

      if (_res.statusCode != 200 && _res.statusCode == 400) {
        throw new Exception(_res.body);
      }

      return config.CurrentResponse(true,
          message: 'data fetched', data: User.fromJson(data['data']));
    } catch (e) {
      return config.CurrentResponse(false,
          message: 'Failed to fetch data, ${e.toString()}');
    }
  }

  Future<void> saveToken(String token) async {
    await SharedPreferences.getInstance()
      ..setString('token', token);
  }

  Future<void> removeToken() async {
    await SharedPreferences.getInstance()
      ..clear();
  }

  Future<String> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString('token')!;
  }

  Future<bool> showOnBoarding() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getBool('onboarding')!;
  }

  Future<void> viewOnBoarding() async {
    await SharedPreferences.getInstance()
      ..setBool('onboarding', true);
  }
}
