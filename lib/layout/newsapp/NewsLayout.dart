import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/remote/dio_helper.dart';
import 'package:untitled/Search/SearchScreen.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/shared/news/cubit.dart';
import 'package:untitled/shared/news/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context,state) {} ,
      builder:(context,state){
        return Scaffold(
          backgroundColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
                statusBarIconBrightness: NewsCubit.get(context).isBlack?Brightness.light:Brightness.dark,
            ),
            iconTheme: IconThemeData(
              color: NewsCubit.get(context).isBlack?Colors.deepOrange:Colors.black,
            ),
            backgroundColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
            elevation: 0.0,
            title: Text('News App',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: NewsCubit.get(context).isBlack?Colors.white:Colors.black
            ),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){
                navigateTo(context,SearchScreen());
              },
                  icon: Icon(Icons.search)
              ),
              IconButton(onPressed: (){
                NewsCubit.get(context).darkMode();
              },
                  icon: Icon(NewsCubit.get(context).isBlack?Icons.dark_mode:Icons.dark_mode_outlined)
              )
            ],
          ),
          body: NewsCubit.get(context).screens[NewsCubit.get(context).currentstate],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              backgroundColor: NewsCubit.get(context).isBlack?Colors.black:Colors.white,
            currentIndex: NewsCubit.get(context).currentstate,
            onTap: (index){
              NewsCubit.get(context).changeNavBar(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.business),
                  label: 'Business'
              ),
              BottomNavigationBarItem(icon: Icon(Icons.sports_football),
                  label: 'Sports'
              ),
              BottomNavigationBarItem(icon: Icon(Icons.science),
                  label: 'Science'
              )
            ],
          ),
        );
      }
    );
  }
}
