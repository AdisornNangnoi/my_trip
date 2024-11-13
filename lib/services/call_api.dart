//call_api.dart
//ไฟล์นี้จะประกอบเมธอดต่างๆ ที่ใช้เรียก  API ต่างๆ ตามวัตถุประสงค์การทำงานของ App
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_trip_project/models/myprofile.dart';
import 'package:my_trip_project/models/trip.dart';
import 'package:my_trip_project/utils/env.dart';

class CallAPI {
  //เมธอดเรียก API ตรวจสอบชื่อผู้ใช้รหัสผ่าน --------------------------
  static Future<Myprofile> callCheckLoginAPI(Myprofile myprofile) async {
    //เรียกใช้ API แล้วเก็บค่าที่ได้จาก API ไว้ในตัวแปร
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mt6552410001/apis/checkUserPasswordMyprofileAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(myprofile.toJson()),
    );

    if (responseData.statusCode == 200) {
      return Myprofile.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

  static Future<Myprofile> callRegisterMemberAPI(Myprofile myprofile) async {
    //เรียกใช้ API แล้วเก็บค่าที่ได้จาก API ไว้ในตัวแปร
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mt6552410001/apis/newMyprofileAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(myprofile.toJson()),
    );

    if (responseData.statusCode == 200) {
      return Myprofile.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

  static Future<Myprofile> callUpdateMyprofileAPI(Myprofile myprofile) async {
    //เรียกใช้ API แล้วเก็บค่าที่ได้จาก API ไว้ในตัวแปร
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mt6552410001/apis/updateMyprofileAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(myprofile.toJson()),
    );

    if (responseData.statusCode == 200) {
      return Myprofile.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

  static Future<List<Trip>> getAllTripByUserIdAPI(
      Trip trip) async {
    final responseData = await http.post(
      Uri.parse(Env.hostName +
          '/mt6552410001/apis/getAllTripByUserIdAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trip.toJson()),
    );

    if (responseData.statusCode == 200) {
      final dataList = await jsonDecode(responseData.body).map<Trip>((json) {
        return Trip.fromJson(json);
      }).toList();

      return dataList;

      
    } else {
      throw Exception('Failed to call API');
    }
  }

  static Future<Trip> callInsertTripAPI(Trip trip) async {
    //เรียกใช้ API แล้วเก็บค่าที่ได้จาก API ไว้ในตัวแปร
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mt6552410001/apis/newTripAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trip.toJson()),
    );

    if (responseData.statusCode == 200) {
      return Trip.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

  //เมธอดเรียก API บันทึกแก้ไขข้อมูลบันทึกการกิน --------------------------
  static Future<Trip> callUpdateTripAPI(Trip trip) async {
    //เรียกใช้ API แล้วเก็บค่าที่ได้จาก API ไว้ในตัวแปร
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mt6552410001/apis/updateTripAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trip.toJson()),
    );

    if (responseData.statusCode == 200) {
      return Trip.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

  //เมธอดเรียก API บันทึกลบข้อมูลบันทึกการกิน --------------------------
  static Future<Trip> callDeleteTripAPI(Trip trip) async {
    //เรียกใช้ API แล้วเก็บค่าที่ได้จาก API ไว้ในตัวแปร
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mt6552410001/apis/deleteTripAPI.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(trip.toJson()),
    );

    if (responseData.statusCode == 200) {
      return Trip.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }
}

