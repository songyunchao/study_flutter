import 'package:flutter/material.dart';
import 'package:study_flutter/http/core/hi_error.dart';
import 'package:study_flutter/http/dao/login_dao.dart';
import 'package:study_flutter/util/string_util.dart';
import 'package:study_flutter/util/toast.dart';
import 'package:study_flutter/widget/appbar.dart';
import 'package:study_flutter/widget/login_button.dart';
import 'package:study_flutter/widget/login_effect.dart';
import 'package:study_flutter/widget/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool protect = false;
  bool loginEnable = false;
  String username = "" ;
  String password = "" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('密码登录', '注册', () { }),
      body: Container(
        child: ListView(
          children: [
            LoginEffect(protect: protect),
            LoginInput(title: '用户名', hint: '请输入用户名',
                onChanged: (value) {
                username = value;
                checkInput();
              }
            ),
            LoginInput(title: '密码', hint: '请输入密码',obscureText: true,
                onChanged: (value) {
                  password = value;
                  checkInput();
                },
                focusChanged: (hasFocus) {
                  setState(() {
                    protect = hasFocus;
                  });
                }
            ),
            Padding(padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
            child: LoginButton( enable: loginEnable , titile: '登录',
                onPressed: () {
                    send();
                  }
              ),
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
    ){
      enable = true;
    }else{
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });

  }

  void send() async{
    try {
      var result =  await LoginDao.login(username,password );
      print("登录结果: $result");
      if(result['code'] == 0){
        print('登录成功');
        showToast('登录成功');
      }else{
        print(result['msg']);
        showWarningToast(result['msg']);
      }
    }on NeedAuth catch(e){
      print('需要登录');
      print(e);
      showWarningToast(e.message);
    }on NeedLogin catch(e){
      print(e);
      showWarningToast(e.message);
    }on HiNetError catch(e){
      print(e);
      showWarningToast(e.message);
    }

  }
}
