import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:study_flutter/db/hi_cache.dart';
import 'package:study_flutter/http/core/hi_error.dart';
import 'package:study_flutter/http/core/hi_net.dart';
import 'package:study_flutter/http/dao/login_dao.dart';
import 'package:study_flutter/http/request/test_request.dart';

import 'model/owner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async{
    // TestRequest  request  = TestRequest();
    // // request.add('aa', 'ddd').add('bb', '333');
    // request.add('aa', 'ddd').add('bb', '333').add('requestPrams', 'kkk');
    // try {
    //   var result  = await HiNet.getInstance().fire(request);
    //   print(result);
    // }on NeedAuth catch(e){
    //   print(e);
    // }on NeedLogin catch(e){
    //   print(e);
    // }on HiNetError catch(e){
    //   print(e) ;
    // }
    // test();
    // test01();
    // test02();
    testLogin();
    setState(() {
      _counter++;
    });
  }
  void test(){
    const jsonString = "{\"name\":\"Tom\",\"age\":18}";
    Map<String, dynamic> map = jsonDecode(jsonString); 
    print('name: ${map['name']}, age: ${map['age']}');
    //map转json
    String json = jsonEncode(map);
    print(json);
  }
  void test01(){
    var owerMap  = {
      "name":"Tom",
      "face":"https://www.baidu.com/img/bd_logo1.png",
      "fans":100
    };
    Owner owner = Owner.fromJson(owerMap);
    print("name: ${owner.name}, face: ${owner.face}, fans: ${owner.fans}");
  }
  Future<void> test02() async {
     var cash = await HiCache.getInstance() ;
     cash.setString('111', '222');
     String value = cash.get<String>('111');
     print('value: $value');
  }
  void testLogin()async{
    try {
      // var result =  await LoginDao.register('123456','123456','123456','123456');
      // print("注册结果: $result");
      var result =  await LoginDao.login('jvadd','dddd112002');
      print("登录结果: $result");
    }on NeedAuth catch(e){
      print(e);
    }on NeedLogin catch(e){
      print(e);
    }on HiNetError catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
