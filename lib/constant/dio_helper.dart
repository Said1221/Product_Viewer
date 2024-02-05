
import 'package:dio/dio.dart';


class dioHelper{

  static Dio? dio;

  // initialize the base url
  static init(){
    dio = Dio(
      BaseOptions(
        // constant url (base url)
        baseUrl: 'https://645fa821ca2d89f7e74b2e3a.mockapi.io/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // get data from the server
  // by sending dynamic url (Products) from cubit.dart
  static Future<Response>getData({
    required String url
  })async{
    return await dio!.get(
      url,
    );
  }

}
