import 'package:flutter/material.dart';
import 'package:study_flutter/model/video_model.dart';
import 'package:study_flutter/page/home_tab_page.dart';
import 'package:study_flutter/widget/custom_button.dart';
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
            padding: const EdgeInsets.only(top: 10),
            child: _tabBar(),
          ),
          Flexible(child: TabBarView(
            controller: _controller,
            children: tabs.map((tab) {
              return Center(
                child: HomeTabPage(name: tab),
              );
            }).toList(),
          )),
         Row(
           children: [
             CustomButton(
               minWidth: 100,
               height: 100,
               onPressed: () {
                 print('测试按钮') ;
               }, label: '按钮',
               child: Container(
                 child: const Column(
                   children: [
                     Icon(
                       Icons.person,
                       size: 30,
                     ),
                     SizedBox(height: 10,),
                     Text('人员信息')
                   ],
                 ),
               ),
             ),
             CustomButton(
               minWidth: 100,
               height: 100,
               onPressed: () {
                 print('测试按钮') ;
               }, label: '按钮',
               child: Container(
                 child: const Column(
                   children: [
                     Icon(
                       Icons.person,
                       size: 30,
                     ),
                     SizedBox(height: 10,),
                     Text('人员信息')
                   ],
                 ),
               ),
             ),
           ],
         ),
          Row(
            children: [
              CustomButton(
                minWidth: 100,
                height: 100,
                onPressed: () {
                  print('测试按钮') ;
                }, label: '按钮',
                child: Container(
                  child: const Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      SizedBox(height: 10,),
                      Text('人员信息')
                    ],
                  ),
                ),
              ),
              CustomButton(
                minWidth: 100,
                height: 100,
                onPressed: () {
                  print('测试按钮') ;
                }, label: '按钮',
                child: Container(
                  child: const Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      SizedBox(height: 10,),
                      Text('人员信息')
                    ],
                  ),
                ),
              ),
              CustomButton(
                minWidth: 100,
                height: 100,
                onPressed: () {
                  print('测试按钮') ;
                }, label: '按钮',
                child: Container(
                  child: const Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      SizedBox(height: 10,),
                      Text('人员信息')
                    ],
                  ),
                ),
              ),
            ],
          )
        ]
      )
    );
  }

  _tabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: TabBar(
        controller: _controller,
        isScrollable: true,
        labelColor: Colors.black,
        labelPadding: EdgeInsets.only(left: 5.0, right: 5.0),
        indicatorPadding: EdgeInsets.only(left: 5.0, right: 5.0),
        tabs: tabs.map((tab) {
          return Tab(
            child:Padding(
              padding: EdgeInsets.only(left: 5,right: 5),
              child: Text(tab,style: TextStyle(fontSize: 16),),
            )
          );
        }).toList(),
      ),
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
