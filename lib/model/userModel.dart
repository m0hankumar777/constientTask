// import 'dart:convert';

// import 'package:json_annotation/json_annotation.dart';
// part 'userModel.g.dart';

// LoginUser loginUserFromJson(String str) => LoginUser.fromJson(jsonDecode(str));

// @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
// class LoginUser {
//   LoginUser({
//     required this.user,
//     required this.dCharge,
//     required this.responseCode,
//     required this.result,
//     required this.responseMsg,
//   });

//   UserDetails user;
//   dynamic dCharge;
//   String responseCode;
//   String result;
//   String responseMsg;

//   factory LoginUser.fromJson(Map<String, dynamic> json) =>
//       _$LoginUserFromJson(json);
// }

// @JsonSerializable(fieldRename: FieldRename.snake)
// class UserDetails {
//   UserDetails({
//     required this.id,
//     required this.name,
//     required this.lastName,
//     required this.mobile,
//     required this.phone,
//     required this.address1,
//     required this.address2,
//     required this.city,
//     required this.pin,
//     required this.state,
//     required this.country,
//     required this.email,
//     required this.password,
//     required this.discussion,
//     required this.profileUrl,
//     required this.imageLink,
//     required this.emailVerify,
//     required this.verificationCode,
//     required this.imei,
//     required this.wallet,
//     required this.appid,
//     required this.status,
//     required this.datetime,
//     required this.fid,
//     required this.otp,
//   });
//   String id;
//   String name;
//   String lastName;
//   String mobile;
//   String phone;
//   String address1;
//   String address2;
//   String city;
//   String pin;
//   String state;
//   String country;
//   String email;
//   String password;
//   String discussion;
//   String profileUrl;
//   String imageLink;
//   String emailVerify;
//   dynamic verificationCode;
//   String imei;
//   String wallet;
//   String appid;
//   String status;
//   String datetime;
//   String fid;
//   String otp;
//   factory UserDetails.fromJson(Map<String, dynamic> json) =>
//       _$UserDetailsFromJson(json);
// }
import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(jsonDecode(str));

class LoginUser {
  LoginUser({
    required this.user,
    required this.dCharge,
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  UserDetails user;
  dynamic dCharge;
  String responseCode;
  String result;
  String responseMsg;

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
      dCharge: json["d_charge"],
      responseCode: json["ResponseCode"],
      responseMsg: json["ResponseMsg"],
      result: json["Result"],
      user: UserDetails.fromJson(json["user"]));
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.name,
    required this.lastName,
    required this.mobile,
    required this.phone,
    required this.address1,
    required this.address2,
    required this.city,
    required this.pin,
    required this.state,
    required this.country,
    required this.email,
    required this.password,
    required this.discussion,
    required this.profileUrl,
    required this.imageLink,
    required this.emailVerify,
    required this.verificationCode,
    required this.imei,
    required this.wallet,
    required this.appid,
    required this.status,
    required this.datetime,
    required this.fid,
    required this.otp,
  });
  String id;
  String name;
  String lastName;
  String mobile;
  String phone;
  String address1;
  String address2;
  String city;
  String pin;
  String state;
  String country;
  String email;
  String password;
  String discussion;
  String profileUrl;
  String imageLink;
  String emailVerify;
  dynamic verificationCode;
  String imei;
  String wallet;
  String appid;
  String status;
  String datetime;
  String fid;
  String otp;
  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        mobile: json["mobile"],
        phone: json["phone"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        pin: json["pin"],
        state: json["state"],
        country: json["country"],
        email: json["email"],
        password: json["password"],
        discussion: json["discussion"],
        profileUrl: json["profile_url"],
        imageLink: json["image_link"],
        emailVerify: json["email_verify"],
        verificationCode: json["verification_code"],
        imei: json["imei"],
        wallet: json["wallet"],
        appid: json["appid"],
        status: json["status"],
        datetime: json["datetime"],
        fid: json["fid"],
        otp: json["otp"],
      );
}
