
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/remote/dio_helper.dart';
import 'package:untitled/modules/business/businessLayout.dart';
import 'package:untitled/modules/science/scienceLayout.dart';
import 'package:untitled/modules/settings/settings.dart';
import 'package:untitled/modules/sports/sportsLayout.dart';
import 'package:untitled/shared/news/states.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super (NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentstate = 0;
  List<dynamic>business = [];
  List<dynamic>Sport = [];
  List<dynamic>Science = [];
  List<dynamic>Search = [];
  bool isBlack = false;
  List<Widget>screens =[
    BusinessLayout(),
    SportsLayout(),
    ScienceLayout(),
  ];
  void changeNavBar(int index){
    currentstate = index;
    if(index==1){
      getSport();
    }
    else{
      getScience();
    }
    emit(NewsBottomNavState());
  }
  void getBusiness(){
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'business',
      'apikey':'d4494551157847bd8cd42bcfe5eac8a5',
    }).then((value) {
      business = value.data['articles'];
      emit(NewsBusinnessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsErrorState());
    });
  }
  void getSport(){
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'sports',
      'apikey':'d4494551157847bd8cd42bcfe5eac8a5',
    }).then((value) {
      Sport = value.data['articles'];
      emit(NewsSportState());
    }).catchError((error){
      print(error.toString());
      emit(NewsErrorState());
    });
  }
  void getScience(){
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'science',
      'apikey':'d4494551157847bd8cd42bcfe5eac8a5',
    }).then((value) {
      Science = value.data['articles'];
      emit(NewsScienceState());
    }).catchError((error){
      print(error.toString());
      emit(NewsErrorState());
    });
  }
  void getSearch(String value){
    Search=[];
    DioHelper.getData(url: 'v2/everything',
        query: {
      'q':'$value',
      'apikey':'d4494551157847bd8cd42bcfe5eac8a5',
    }).then((value) {
      Search = value.data['articles'];
      emit(NewsSearchState());
    }).catchError((error){
      print(error.toString());
      emit(NewsErrorState());
    });
  }
  void darkMode(){
    if(isBlack==true){
      isBlack = false;
    }
    else{
      isBlack = true;
    }
    emit(NewsThemeState());
  }
}