
import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(

          padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomAppBar(),
            ),
            FeaturedBookListView(),
            SizedBox(height: 49,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 30,),
            child :Text("Best Seller",style:Styles.textStyle18)),
            SizedBox(height: 20,),

          ],
        ),
      ) ,

        BestSellerListView(),

      ],
    );


  }
}






