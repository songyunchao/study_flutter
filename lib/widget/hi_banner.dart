// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';
//
// class HiBanner extends StatelessWidget {
//   const HiBanner({super.key, required this.bannerList,   this.bannerHeight = 160,   this.padding = 2});
//
//   final List<BannerMo> bannerList;
//   final double bannerHeight;
//   final EdgeInsetsGeometry padding;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: bannerHeight,
//       child:  _banner(),
//     );
//   }
//
//   _banner() {
//     var right = 10.0+(padding?.horizontal??0)/2 ;
//     return Swiper(
//         itemCount: bannerList.length,
//       autoplay: true,
//       itemBuilder: (BuildContext context, int index) {
//         return  _image(bannerList[index]);      },
//         );
//       }
//
//   _image(BannerMo bannerMo) {
//      return InkWell(
//        onTap: (){
//          print('点击了$bannerMo.title')
//        },
//        child: Container(
//          padding: padding,
//          child: ClipRRect(
//            borderRadius: BorderRadius.all(Radius.circular(6)),
//            child: Image.network(bannerMo.cover,fit: BoxFit.cover),
//          ),
//        ),
//      );
//   }
//
// }
