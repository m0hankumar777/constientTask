import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task1/model/categoryModel.dart';
import 'package:task1/model/userModel.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://www.greetingsworld.uk/api')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST('/login.php')
  Future<LoginUser> login(@Body() Map<String, dynamic> body);

  @GET('/cat.php')
  Future<Category> getCategory();
}
