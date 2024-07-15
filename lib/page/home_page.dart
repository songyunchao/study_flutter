import 'package:flutter/material.dart';
import 'package:study_flutter/model/video_model.dart';
import 'package:study_flutter/page/home_tab_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onJumpToDetail});

  final ValueChanged<VideoModel> onJumpToDetail;



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _controller;
  var tabs = ['推荐', '热门', '追播', '影视', '搞笑', '日常', '综合', '手机游戏', '短片'];

  @override
  initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync:  this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            // padding: EdgeInsets.only(top: 30),
            child: _tabBar(),
          ),
          Flexible(child: TabBarView(
            controller: _controller,
            children: tabs.map((tab) {
              return Center(
                child: HomeTabPage(name: tab),
              );
            }).toList(),
          ))
        ]
      )
    );
  }

  _tabBar() {
    return TabBar(
      controller: _controller,
      isScrollable: true,
      labelColor: Colors.black,

      tabs: tabs.map((tab) {
        return Tab(
          child: Text(tab,style: TextStyle(fontSize: 16),),
        );
      }).toList(),
    );
  }
}
