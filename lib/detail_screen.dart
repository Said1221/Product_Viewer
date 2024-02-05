import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';


Widget buidDetails(list)=>Scaffold(
  appBar: AppBar(
    title: Text('Product details' , style: TextStyle(fontSize: 20),),
    titleSpacing: 0,
    backgroundColor: Colors.teal,
  ),
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

// portrait widget
Widget portrait(list)=> SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
        children: [
          Text(list['name'].toString() , style: TextStyle(fontWeight: FontWeight.bold),),
          Image(width: double.infinity, image: NetworkImage(list['image_url'])),
          SizedBox(
            height: 10,
          ),
          Text(list['description']),
        ],
      ),
  ),
);

// landscape widget
Widget landscape(list)=> SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Image(image: NetworkImage(list['image_url']))),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Text(list['name'].toString())),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(list['description']),
        ],
      ),
  ),
);


