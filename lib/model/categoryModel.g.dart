// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      data: (json['data'] as List<dynamic>)
          .map((e) => CatDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseCode: json['ResponseCode'] as String,
      result: json['Result'] as String,
      responseMsg: json['ResponseMsg'] as String,
    );

CatDatum _$CatDatumFromJson(Map<String, dynamic> json) => CatDatum(
      id: json['id'] as String,
      catname: json['catname'] as String,
      catimg: json['catimg'] as String,
      count: json['count'] as String,
    );
