import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/shared/news/cubit.dart';
import 'package:untitled/shared/news/states.dart';

class SearchScreen extends StatelessWidget {
var searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context,state){} ,
      builder:(context,state){
        var list = NewsCubit.get(context).Search;
        return Scaffold(
          backgroundColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
              statusBarIconBrightness: NewsCubit.get(context).isBlack?Brightness.light:Brightness.dark,
            ),
            iconTheme: IconThemeData(
              color: NewsCubit.get(context).isBlack?Colors.deepOrange:Colors.black
            ),
            title: Text('Search',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color:NewsCubit.get(context).isBlack?Colors.white:Colors.black
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 45.0,
                  child: TextFormField(
                    style: TextStyle(color: NewsCubit.get(context).isBlack?Colors.white:Colors.black),
                    controller:searchController ,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'search must not be empty';
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Search',
                        labelStyle: TextStyle(
                          color: Colors.deepOrange
                        ),
                        prefixIcon:Icon(Icons.search,
                        color: Colors.deepOrange,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: NewsCubit.get(context).isBlack?Colors.deepOrange:Colors.black
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: Colors.deepOrange
                        ),
                      )
                        ),
                    ),
                  ),
                ),
              Expanded(child: articleBuilder(list))
            ],
          ),
        );
      } ,
    );
  }
}
