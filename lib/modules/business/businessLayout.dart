import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/shared/news/cubit.dart';
import 'package:untitled/shared/news/states.dart';

class BusinessLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).business;
        return articleBuilder(list);
      },
    );

  }
}
