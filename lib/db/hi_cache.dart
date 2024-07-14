import 'package:shared_preferences/shared_preferences.dart';

// 缓存管理类
class HiCache {
  SharedPreferences? prefs;

  HiCache._(); // 私有构造函数，防止外部直接创建实例

  static HiCache? _instance;

  // 命名构造函数，用于初始化带有SharedPreferences的实例
  HiCache._pre(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  // 初始化实例
  static Future<HiCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
    return _instance!;
  }

  // 获取实例
  static Future<HiCache> getInstance() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
    return _instance!;
  }
  setString(String  key ,String value){
    prefs?.setString(key, value);
  }
  setDouble(String  key ,double value){
    prefs?.setDouble(key, value);
  }
  setInt(String  key ,int value){
    prefs?.setInt(key, value);
  }
  setBool(String  key ,bool value){
    prefs?.setBool(key, value);
  }
  setStringList(String  key ,List<String> value){
    prefs?.setStringList(key, value);
  }
  T get<T>(String key){
    return prefs?.get(key) as T;
  }


}