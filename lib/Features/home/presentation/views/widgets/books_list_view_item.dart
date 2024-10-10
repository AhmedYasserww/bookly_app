import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key,required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel);
      },
      child: SizedBox(
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBookItem(imageUrl:bookModel.volumeInfo.imageLinks?.thumbnail??"https://via.placeholder.com/150"),
           const SizedBox(width: 30,),
            Expanded(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width:MediaQuery.of(context).size.width * .5,
                      child:  Text(bookModel.volumeInfo.title!,style: Styles.textStyle20.copyWith(fontFamily: "GTSectraFine"),
                        maxLines: 2,
                        overflow:TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 2,),

                     Text(
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       bookModel.volumeInfo.authors?.isNotEmpty ?? false
                           ? bookModel.volumeInfo.authors![0]
                           : 'Unknown author',
                       style: Styles.textStyle14,
                     ),
                  const SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Free",style:Styles.textStyle20.copyWith(fontWeight:FontWeight.bold),),
                      BookRating(
                       // rating: (bookModel.volumeInfo.averageRating?? 0).toInt(),
                        count: bookModel.volumeInfo.pageCount?? 0,
                      )
                    ]
                  )
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}