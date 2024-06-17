import 'package:study_flutter/http/core/dio_adapter.dart';
import 'package:study_flutter/http/core/hi_error.dart';
import 'package:study_flutter/http/core/hi_net_adapter.dart';
import 'package:study_flutter/http/request/base_request.dart';

import 'mock_adapter.dart';

class HiNet {
  HiNet._();
  static  HiNet  _instance =HiNet._();
  static HiNet getInstance(){
    _instance ??= HiNet._();
    return _instance;
  }

  Future fire(BaseRequest requset) async{
    HiNetResponse? response  ;
    var  error;
    try{
      response = await _send(requset);
    }on HiNetError catch(e){
      error  = e.data;
      response = e.data;
      _printLog(e.message);
    }catch(e){
      error= e;
      _printLog(error);
    }
    if(response == null) {
      _printLog(error);
    }

    var  result = response?.data;
    print(result);
    var status = response?.statusCode;
    switch(status){
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(),data: result);
      default:
        throw HiNetError(status!,result.toString(),data: result);
    }
  }

  Future<dynamic>_send<T>(BaseRequest requset) async{
    // _printLog('url:${requset.url()}');
    // _printLog('method:${requset.httpMethod()}');
    // requset.addHeader("token","123");
    // _printLog('header:${requset.header}');
    // return Future.value({"statusCode":200,"data":{
    //   "code":0,"message":"success"
    // }});

    //使用mock 发送请求
    // HiNetAdapter adapter = MockAdapter();
    // return await adapter.send(requset);

    //使用dio 发送请求
    HiNetAdapter adapter = DioAdapter();
    return await adapter.send(requset);
  }
  void _printLog(String log) {
    print('hi_net: $log');
  }

}