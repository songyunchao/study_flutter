import 'package:flutter/material.dart';
import 'package:study_flutter/model/video_model.dart';
import 'package:study_flutter/page/home_tab_page.dart';
import 'package:study_flutter/widget/custom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onJumpToDetail, required this.onJumpTo});

  final ValueChanged<VideoModel> onJumpToDetail;
  final ValueChanged<int> onJumpTo;



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
      // appBar: AppBar(),
      body: Column(
        children: [
          CustomNavigationBar(
            height: 50,
            color:Colors.white,
            statusStyle: StatusStyle.DARK_CONTENT,
            child:_appBar(),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 40),
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

  _appBar() {
    return Padding(padding: EdgeInsets.only(left: 15,right: 15),
    child: Row(
      children: [
        InkWell(
          onTap: (){
            if(widget.onJumpTo != null){
              widget.onJumpTo(3);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: Image(image: AssetImage('images/login_left.png'),width: 46,height: 46,),
          ),
        ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 32,
                     alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    decoration: BoxDecoration(color: Colors.grey[200]),
                  ),
                )
            )
        ),
        const Icon(
          Icons.explore_outlined,
          color: Colors.grey,
        ),
        const Padding(padding: EdgeInsets.only(left: 15),
        child:Icon(
          Icons.mail_outline,
          color: Colors.grey,
        )
        )
      ],
    ),
    );
  }
}
