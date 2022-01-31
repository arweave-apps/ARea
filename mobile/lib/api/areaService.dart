import 'package:mobile/api/apiService.dart';
import 'package:mobile/api/model/loginRequest.dart';
import 'dart:developer' as developer;
import 'model/iftttRequest.dart';
import 'model/iftttResponse.dart';
import 'model/registerResponse.dart';
import 'model/tokenRequest.dart';

class areaService {
  late apiService api;
  registerResponse? token;

  areaService(String url) {
    if (url.isNotEmpty) {
      api = apiService(url);
    }
  }

  void initConnexion(String url) {
    try {
      developer.log('initConnexion: IT\'S CALL MON KAKE');
      api = apiService(url);
    } catch (e) {
      developer.log('initConnexion: Invalid input');
    }
  }

  Future<bool> tryConnexion(String user, String pass) async {
    try {
      developer.log('tryConnexion: Start');
      dynamic response = await api.makeRequestPost<loginRequest>("/auth/login", loginRequest(user, pass), 200);
      developer.log('tryConnexion: request OK');
      token = registerResponse.fromJson(response);
      developer.log('tryConnexion: parse OK');
      return true;
    } catch (e) {
      developer.log('tryConnexion: Server failed invalid response -> ' + e.toString());
      return false;
    }
  }

  Future<bool> createUserAndConnexion(String user, String pass) async {
    try {
      dynamic response = await api.makeRequestPost<loginRequest>("/auth/register", loginRequest(user, pass), 201);
      token = registerResponse.fromJson(response);
      return true;
    } catch (e) {
      developer.log('createUserAndConnexion: Server failed invalid response -> ' + e.toString());
      return false;
    }
  }

  Future<bool> createIfttt(String action, String reaction) async {
    try {
      dynamic _ = await api.makeRequestPost<iftttRequest>("/auth/register", iftttRequest(action, true, reaction), 200);
      return true;
    } catch (e) {
      developer.log('createIfttt: Server failed invalid response -> ' + e.toString());
      return false;
    }
  }

  Future<bool> deleteIfttt() async {
    try {
      // TODO
      return true;
    } catch (e) {
      developer.log('deleteIfttt: Server failed invalid response -> ' + e.toString());
      return false;
    }
  }

  Future<bool> updateIfttt() async {
    try {
      // TODO
      return true;
    } catch (e) {
      developer.log('updateIfttt: Server failed invalid response -> ' + e.toString());
      return false;
    }
  }

  Future<bool> getListIfttt() async {
    try {
      dynamic list = api.makeRequestGetList<tokenRequest>("/area/list", 200);
      // TODO exctract data Future<List<iftttResponse>>
      token?.areas = list;
      return true;
    } catch (e) {
      developer.log('getListIfttt: Server failed invalid response -> ' + e.toString());
      return false;
    }
  }
}