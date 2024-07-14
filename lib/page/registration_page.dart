import 'package:flutter/material.dart';
import 'package:study_flutter/http/core/hi_error.dart';
import 'package:study_flutter/http/dao/login_dao.dart';
import 'package:study_flutter/util/string_util.dart';
import 'package:study_flutter/widget/appbar.dart';
import 'package:study_flutter/widget/login_button.dart';
import 'package:study_flutter/widget/login_effect.dart';
import 'package:study_flutter/widget/login_input.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key,   required this.onJumpToLogin});

  final  VoidCallback onJumpToLogin;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool protect = false;
  bool loginEnable = false;
  String username = "" ;
  String password = "" ;
  String rePassword = "" ;
  String imoocId = "" ;
  String orderId = "" ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar('注册', "登录", widget!.onJumpToLogin),
      body:  Container(
        alignment: Alignment.center,
        child: ListView(
          //自适应键盘弹起，防止遮挡
          children: [
            LoginEffect(protect: protect),
            LoginInput(title: "用户名", hint: "请输入用户名", onChanged: (value) {
             username = value;
             checkInput();
            }),
            LoginInput(title: "密码", hint: "请输入密码",obscureText: true,lineStretch: true,
                onChanged: (value) {
                  password = value;
                  checkInput();
                },
                focusChanged: (hasFocus) {
                  setState(() {
                    protect = hasFocus;
                  });
                },
                ),
            LoginInput(title: "确认密码", hint: "请再次 输入密码",obscureText: true,lineStretch: true,
              onChanged: (value) {
                rePassword = value;
                checkInput();
              },
              focusChanged: (hasFocus) {
                setState(() {
                  protect = hasFocus;
                });
              },
            ),
            LoginInput(title: "默课网ID", hint: "请输入你的默课网ID",
                keyboardType: TextInputType.number,
                onChanged: (value) {
                imoocId = value;
                checkInput();
              }),
            LoginInput(title: "课程订单号", hint: "请输入课程订单号后四位",
                keyboardType: TextInputType.number,
                lineStretch: true,
                onChanged: (value) {
                orderId = value;
                checkInput();
              }),
            Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            child: LoginButton(titile: '注册',enable: loginEnable, onPressed:checkParams,),
            )
          ],
        ),
      ),
    );
  }

  void checkInput() {
    bool enable ;
    if(isNotEmpty(username)
        && isNotEmpty(password)
        && isNotEmpty(rePassword)
        && isNotEmpty(imoocId)
        && isNotEmpty(orderId)){
      enable = true;
    }else{
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });

  }

  _loginButton() {
    return InkWell(
      onTap: (){
        if(loginEnable){
          checkParams();
        }else{
          print('输入不完整');
        }
      },
      child: Text('注册'),
    );
  }

  void send() async{
    try {
      var result =  await LoginDao.register(username,password,imoocId,orderId);
      print("注册结果: $result");
      if(result['code'] == 0){
        print('注册成功');
        if(widget.onJumpToLogin != null){
          widget.onJumpToLogin();
        }
      }else{
        print(result['msg']);
      }
    }on NeedAuth catch(e){
      print(e);
    }on NeedLogin catch(e){
      print(e);
    }on HiNetError catch(e){
      print(e);
    }

  }

  void checkParams() {
    String  tips;
    if(password != rePassword){
      tips = '密码不一致';
    }else if(isEmpty(username)){
      tips = '用户名不能为空';
    }else if(isEmpty(password)){
      tips = '密码不能为空';
    }else if(isEmpty(imoocId)){
      tips = '默课网ID不能为空';
    }else if(isEmpty(orderId)){
      tips = '课程订单号不能为空';
    }else if (orderId.length != 4){
      tips = '请输入订单号的后四位';
    }else{
      tips = '';
    }
    if(tips.isNotEmpty){
      print(tips);
      return;
    }
    send();
  }

}
