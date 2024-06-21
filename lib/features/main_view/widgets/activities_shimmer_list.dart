import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class ActivitiesShimmerList extends StatelessWidget {
  const ActivitiesShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(left: MQuery.getWidth(context, 14),right: MQuery.getWidth(context, 14)),

        itemBuilder: (context,index){
          return SizedBox(
            width: MQuery.getWidth(context, 328),
            height: 80,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
          width: MQuery.getWidth(context, 328),
                constraints: const BoxConstraints(
                    minHeight: 80
                ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),color: Colors.grey.withOpacity(0.2),
              ),),
            ),
          );

        }, separatorBuilder: (context,index){
     return const SizedBox(
        height: 15 ,
      );
    }, itemCount: 20);
  }
}
