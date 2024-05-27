// 测试适配器


import 'package:study_flutter/http/core/hi_net_adapter.dart';
import 'package:study_flutter/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter{
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse<T>>.delayed(Duration(microseconds: 10000),(){
      return HiNetResponse<T>(
        data: {"code": 0, "message": 'success'},
        statusCode: 200,
      );
    });
  }
  
}