import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/constant/component.dart';
import 'package:product_viewer/cubit.dart';
import 'package:product_viewer/detail_screen.dart';
import 'package:product_viewer/state.dart';

class main_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit()..getProducts(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
          builder: (BuildContext context , AppState state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Home' , style: TextStyle(fontSize: 20),),
              backgroundColor: Colors.teal,
            ),

            //if the condition is true the products will be displayed
            body: state is AppGetProductsSuccessState ?
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GridView.count(
                          childAspectRatio: 1/02,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          children: List.generate(cubit.products!.length, (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: ()=>navigateTo(context, buidDetails(cubit.products![index]['Product'])),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(width: double.infinity, image: NetworkImage(cubit.products![index]['Product']['image_url'])),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(child: Text(cubit.products![index]['Product']['name'].toString() ,  maxLines: 4 ,overflow: TextOverflow.ellipsis , style: TextStyle(fontWeight: FontWeight.bold),)),
                                            Flexible(child: Text(cubit.products![index]['Product']['price'].toString() , style: TextStyle(color: Colors.red),)),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Flexible(child: Text(cubit.products![index]['Product']['description'].toString() , maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ):

            // else
            Center(child: CircularProgressIndicator(color: Colors.blue,)),
          );
          },
      ),
    );
  }
}
