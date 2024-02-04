
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class dioHelper{

  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://645fa821ca2d89f7e74b2e3a.mockapi.io/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response>getData({
    required String url
  })async{
    return await dio!.get(
      url,
    );
  }

}
