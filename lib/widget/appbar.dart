//自定义顶部的appbar

import 'package:flutter/material.dart';

appBar (String title,String rightTitle,VoidCallback rightButtonClick){
  return AppBar(
    //让title居左
    centerTitle: false,
    titleSpacing:  0,
    leading: BackButton(),
    title: Text(title, style: TextStyle(fontSize: 18),),
    actions: [
      InkWell(
        onTap: rightButtonClick,
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: Text(
              rightTitle,
              style:TextStyle(fontSize: 16, color:Colors.grey[500]),
              textAlign: TextAlign.center
          ),
        ),
      )
    ],
  );

}