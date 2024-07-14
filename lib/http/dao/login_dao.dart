import 'package:study_flutter/db/hi_cache.dart';
import 'package:study_flutter/http/core/hi_net.dart';
import 'package:study_flutter/http/request/base_request.dart';
import 'package:study_flutter/http/request/login_request.dart';
import 'package:study_flutter/http/request/registration_request.dart';

class LoginDao {
  static const BOARDING_PASS = "boarding-pass";
  static login(String username, String password) {
    return _send(username, password);
  }
  static register(String username, String password,String imoocId,String orderId) {
    return _send(username, password,imoocId:imoocId,orderId:orderId);
  }

  static _send(String username, String password,{imoocId,orderId}) async {
      BaseRequest request;
      if(imoocId != null && orderId != null){
        request = RegistrationRequest();
        request.add("username", username)
            .add("password", password)
            .add("imoocId", imoocId)
            .add("orderId", orderId);
       }else{
        request = LoginRequest();
        request.add("username", username)
            .add("password", password);
      }

      var result = await HiNet.getInstance().fire(request);
      if(result['code'] == 0 && result['data'] != null){
          //保存登录令牌
       var cache = await HiCache.getInstance();
       cache.setString(BOARDING_PASS, result['data']);
      }
      print(result);
      return result;
  }
  static getBoardingPass() async {
    var cache = await HiCache.getInstance();
    return cache.get(BOARDING_PASS);
  }
}