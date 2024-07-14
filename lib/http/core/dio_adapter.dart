//dio适配器
import 'package:dio/dio.dart';
import 'package:study_flutter/http/core/hi_error.dart';
import 'package:study_flutter/http/core/hi_net_adapter.dart';
import 'package:study_flutter/http/request/base_request.dart';

class DioAdapter extends HiNetAdapter{
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) async {
     var response,options = Options( headers: request.header);
     var error;
     try{
       if(request.httpMethod() == HttpMethod.GET){
         response = await Dio().get(request.url(),options: options);
       }else if (request.httpMethod() == HttpMethod.POST){
         response = await Dio().post(request.url(),options: options,data: request.params);
       }else if (request.httpMethod() == HttpMethod.DELETE){
         response = await Dio().delete(request.url(),options: options,data: request.params);
       }
     }on DioError catch(e){
       error = e;
       response = e.response;
     }catch(e){
       error = e;
     }
      if(error != null){
        throw HiNetError(response?.statusCode??-1, error.toString(),data: builRes<T>(response,request));
      }
      return builRes<T>(response, request)  ;

  }
  // 构建HiNetResponse
  HiNetResponse<T> builRes<T>(Response response, BaseRequest request) {
    return HiNetResponse(
      data: response.data,
      request: request,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response
    );
  }


  }