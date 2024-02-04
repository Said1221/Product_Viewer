import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

Widget buidDetails(list)=>Scaffold(
  appBar: AppBar(),
  body: NativeDeviceOrientedWidget(
    portrait: (context){
      return portrait(list);
    },

    landscape: (context){
      return landscape(list);
    },

    fallback: (context ){
      return portrait(list);
    },
  ),
);

Widget portrait(list)=> Column(
    children: [
      Text(list['name'].toString()),
      Image(image: NetworkImage('https://www.woolha.com/media/2019/01/flutter-setting-device-orientation-to-landscape-or-portrait-1200x627.jpg')),
      Text('describtion'),
    ],
  );
Widget landscape(list)=> Column(
    children: [
      Row(
        children: [
          Expanded(child: Image(image: NetworkImage('https://www.woolha.com/media/2019/01/flutter-setting-device-orientation-to-landscape-or-portrait-1200x627.jpg'))),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Text(list['name'].toString())),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text('describtion'),
    ],
  );


