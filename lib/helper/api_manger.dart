import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiManger {
  static Future<List<dynamic>> get(String url) async {
    try {
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('there was an exception');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Map<String, dynamic>> post(
      {required String url, @required dynamic body}) async {
    try {
      Response response = await Dio().post(url, data: body);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('there was an error');
      }
    } catch (e) {
      throw Exception('there was an error');
    }
  }

  static Future<Map<String, dynamic>> put(
      {required String url, @required dynamic body}) async {
    try {
      Response response =
          await Dio().put(url, data: body,);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('there was an error in status code');
      }
    } catch (e) {
      throw Exception('there was an error');
    }
  }
}
