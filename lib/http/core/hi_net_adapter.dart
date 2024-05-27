//统一网络层返回格式
import 'package:study_flutter/http/request/base_request.dart';
import 'dart:convert';
//网络请求抽象类
abstract class HiNetAdapter{
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}


// 统一网络层返回格式
class HiNetResponse<T>{
  T data;
  BaseRequest? request;
  int? statusCode;
  String? statusMessage;
  dynamic? extra;

  @override
  String toString() {
     if(data is Map){
       return json.encode(data);
     }
     return data.toString();
  }

  HiNetResponse(
  { required this.data,   this.request,   this.statusCode,   this.statusMessage, this.extra});
}