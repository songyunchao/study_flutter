import 'package:flutter/material.dart';
import 'package:study_flutter/model/video_model.dart';
import 'package:study_flutter/page/favorite_page.dart';
import 'package:study_flutter/page/home_page.dart';
import 'package:study_flutter/page/profile_page.dart';
import 'package:study_flutter/page/ranking_page.dart';
//底部导航
class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(onJumpToDetail: (VideoModel value) {},),
          const ProfilePage(),
          const FavoritePage(),
          const RankingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavigationBarItem('首页', Icons.home, 0),
          _buildBottomNavigationBarItem('排行', Icons.local_fire_department, 0),
          _buildBottomNavigationBarItem('收藏', Icons.favorite, 0),
          _buildBottomNavigationBarItem('我的', Icons.live_tv, 0),
        ]
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(String title,IconData icon,int  index) {
    return BottomNavigationBarItem(
          icon: Icon(
            icon,
            color: _defaultColor,
          ),
          activeIcon: Icon(
            icon,
            color: _activeColor,
          ),
          label: title,
        );
  }
}
