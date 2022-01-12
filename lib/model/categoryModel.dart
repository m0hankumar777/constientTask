// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// //import 'package:greetings/services/userService.dart';

// // List<Category> categoryFromJson(String str) =>
// //     List<Category>.from(jsonDecode(str).map((x) => Category.fromJson(x)));

// Category categoryFromJson(String str) => Category.fromJson(jsonDecode(str));

// class Category {
//   Category({
//     required this.data,
//     required this.responseCode,
//     required this.result,
//     required this.responseMsg,
//   });

//   List<CatDatum> data;
//   String responseCode;
//   String result;
//   String responseMsg;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         data:
//             List<CatDatum>.from(json["data"].map((x) => CatDatum.fromJson(x))),
//         responseCode: json["ResponseCode"],
//         result: json["Result"],
//         responseMsg: json["ResponseMsg"],
//       );
// }

// class CatDatum {
//   CatDatum({
//     required this.id,
//     required this.catname,
//     required this.catimg,
//     required this.count,
//   });

//   String id;
//   String catname;
//   String catimg;
//   String count;

//   factory CatDatum.fromJson(Map<String, dynamic> json) => CatDatum(
//         id: json["id"],
//         catname: json["catname"],
//         catimg: json["catimg"],
//         count: json["count"],
//       );
// }

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'categoryModel.g.dart';

Category categoryFromJson(String str) => Category.fromJson(jsonDecode(str));

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Category {
  Category({
    required this.data,
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  List<CatDatum> data;
  String responseCode;
  String result;
  String responseMsg;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CatDatum {
  CatDatum({
    required this.id,
    required this.catname,
    required this.catimg,
    required this.count,
  });

  String id;
  String catname;
  String catimg;
  String count;

  factory CatDatum.fromJson(Map<String, dynamic> json) =>
      _$CatDatumFromJson(json);
}
