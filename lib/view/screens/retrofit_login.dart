import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:task1/model/categoryModel.dart';
import 'package:task1/service/api_service.dart';
import 'package:task1/viewModel/categoryViewModel.dart';
import 'package:task1/viewModel/userViewModel.dart';

class RetrofitLogin extends StatefulWidget {
  const RetrofitLogin({Key? key}) : super(key: key);

  @override
  _RetrofitLoginState createState() => _RetrofitLoginState();
}

class _RetrofitLoginState extends State<RetrofitLogin> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "user name"),
            controller: userController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "password"),
            controller: passController,
          ),
          SizedBox(
            height: 25,
          ),
          RaisedButton(
            elevation: 8,
            color: Colors.green,
            onPressed: () {
              retrofitApiCall(userController.text, passController.text);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "login",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
          RaisedButton(
            elevation: 8,
            color: Colors.green,
            onPressed: () {
              retrofitApiGet();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "retrofit get request",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void retrofitApiGet() {
    CategoryViewModel categoryViewModel = CategoryViewModel();
    Timer(Duration(seconds: 2), () {
      print(categoryViewModel.category.responseMsg);
    });
  }

  void retrofitApiCall(String userName, String passWord) async {
    //   var data = {
    //   "mobile": userName,
    //   "password": passWord,
    //   "imei": "867974040836163",
    //   "appid": "9087"
    // };
    var data = {
      "mobile": "7639594918",
      "password": "1234",
      "imei": "867974040836163",
      "appid": "9087"
    };

    UserViewModel userViewModel = UserViewModel(data);
    // userViewModel.fetchData(data);
    Timer(Duration(seconds: 2), () {
      print(userViewModel.user.responseMsg);
    });

    //final url = 'https://www.greetingsworld.uk/api/login.php';
    // final url = 'https://www.greetingsworld.uk/api/cat.php';
    // final response_normal = await dio.Dio().post(url, data: data);
    // if (response_normal.statusCode == 200) {
    //   var result = await jsonDecode(response_normal.data);
    //   if (result['ResponseCode'] == "200") {
    //     print(result['ResponseMsg']);
    //     Category category = await categoryFromJson(response_normal.data);
    //     print("reponse msg" + category.responseMsg);
    //   }
    // }
    //ApiService apiService = ApiService(dio.Dio());
    //final response = await apiService.login(data);

    // final response = await apiService.getCategory();
    //print(response.responseMsg);
    //print(response.user.name);
  }
}
