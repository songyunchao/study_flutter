import 'package:flutter/material.dart';
import 'package:study_flutter/model/video_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onJumpToDetail});

  final ValueChanged<VideoModel> onJumpToDetail;



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( ),
      body: Container(
        child:  Column(
          children:   [
            Text('首页'),
            MaterialButton(
              onPressed: (){
              widget.onJumpToDetail(VideoModel(1));
            },child: Text('跳转到登录页面'),),
          ],
        )
      )
    );
  }
}
