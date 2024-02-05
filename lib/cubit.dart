import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/constant/dio_helper.dart';
import 'package:product_viewer/state.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  // insert data in dynamic list
  List<dynamic>?products;
  void getProducts(){
    dioHelper.getData(
        url: 'Products',
    ).then((value){
      products = value.data;
      emit(AppGetProductsSuccessState());
    }).catchError((error){
      emit(AppGetProductsErrorState());
    });
  }
}