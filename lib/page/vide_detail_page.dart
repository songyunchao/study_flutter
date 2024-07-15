

 import 'package:flutter/material.dart';
import 'package:study_flutter/model/video_model.dart';

class VideoDetailPage extends StatefulWidget {
   const VideoDetailPage({super.key, required this.videoModel});

   final  VideoModel videoModel;

   @override
   State<VideoDetailPage> createState() => _VideoDetailPageState();
 }

 class _VideoDetailPageState extends State<VideoDetailPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(),
       body: Container(
         child:Text('视频详情页,vid:${widget.videoModel.vid}'),
       ),
     );
   }
 }
