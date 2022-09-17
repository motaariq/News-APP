import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/WebView/WebView.dart';
import 'package:untitled/shared/news/cubit.dart';

Widget newsItemBuilder(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(



    padding: const EdgeInsets.all(20.0),



    child: Row(



      children: [



        Container(



          width: 120.0,



          height: 120.0,



          decoration: BoxDecoration(



              borderRadius: BorderRadius.circular(25.0),



              image: DecorationImage(



                  image: NetworkImage(article['urlToImage']==null?"https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101028/112815904-no-image-available-icon-flat-vector-illustration.jpg?ver=6":article['urlToImage']),



                  fit: BoxFit.cover



              )



          ),



        ),



        SizedBox(



          width: 20.0,



        ),



        Expanded(



          child: Container(



            height: 120.0,



            child: Column(



              mainAxisAlignment: MainAxisAlignment.start,



              crossAxisAlignment: CrossAxisAlignment.start,



              children: [



                Expanded(



                  child: Text('${article['title']}',



                    style: TextStyle(



                        color: NewsCubit.get(context).isBlack?Colors.white:Colors.black,



                        fontWeight: FontWeight.bold,



                        fontSize: 18.0



                    ),



                    maxLines: 3,



                    overflow: TextOverflow.ellipsis,



                  ),



                ),



                Text('${article['publishedAt']}',



                  style: TextStyle(



                      color: Colors.grey



                  ),



                )



              ],



            ),



          ),



        )



      ],



    ),



  ),
);
Widget articleBuilder(list)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>newsItemBuilder(list[index],context),
    separatorBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.only(
            right: 30.0,
            left: 30.0
        ),
        child: Container(
          decoration: BoxDecoration(
              color: NewsCubit.get(context).isBlack?Colors.deepOrange[300]:Colors.grey[300],
              borderRadius: BorderRadius.circular(25.0)
          ),
          height: 1.0,
          width: double.infinity,
        ),
      );
    },
    itemCount: list.length
);
void navigateTo(context,widget)=>Navigator.push(context,
    MaterialPageRoute(
        builder: (context)=>widget,
    )
);