import 'package:flutter/material.dart';
//页面状态异常管理
abstract class HiState<T extends StatefulWidget> extends State<T> {
  @override
  void setState(VoidCallback fn) {
   if(mounted){
     super.setState(fn);
   }else{
     print('HiState:页面已经销毁，本次setstate不执行');
   }
     
  }
}