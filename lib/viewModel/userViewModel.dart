import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

import 'package:task1/model/userModel.dart';
import 'package:task1/service/api_service.dart';

class UserViewModel {
  late LoginUser user;
  Map<String, dynamic> data;
  UserViewModel(
    this.data,
  ) {
    fetchData(data);
  }

  Future<void> fetchData(Map<String, dynamic> _data) async {
    ApiService apiService = ApiService(dio.Dio());
    this.user = await apiService.login(_data);
  }
}
