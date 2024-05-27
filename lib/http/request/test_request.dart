import 'package:study_flutter/http/request/base_request.dart';

class TestRequest extends BaseRequest {
  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return 'uapi/test/test';
  }

  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

}