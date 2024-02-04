import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/dio_helper.dart';
import 'package:product_viewer/state.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppinitailState());

  static AppCubit get(context)=>BlocProvider.of(context);



  List<dynamic>?products;
  void getProducts(){
    dioHelper.getData(
        url: 'medicine',
    ).then((value){
      products = value.data;
      emit(AppGetProductsSuccessState());
      // print(products);
    });
  }
}